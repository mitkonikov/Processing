public class GREEDY_PACK {
   int[][] RECT; // INPUT
   int[][] RESULT; // OUTPUT
   int W, H; // Width and Height of the container
   int rectSize = 0; // Input size, # of boxes
   int[] areas; // Area of each box
   int[] sortedIndexes; // Sorted indexes by bigger area
   int firstLeafPointer = 0; // Used for iteration over the NODES
   
   // PLACING POSITIONS (NODES)
   ArrayList<NODE> nodes = new ArrayList<NODE>();
   int nodeSize = 0;
   
   /// rect - array containing the information for each rectangle
   /// rect[box][0] - width
   /// rect[box][1] - height
   /// w - max width of the BIN
   /// h - max height of the BIN
   GREEDY_PACK(int[][] rect, int w, int h) {
      RECT = rect; W = w; H = h;
      
      calculateAreas();
      sortAreas();
      pack();
   }
   
   private void pack() {
      RESULT = new int[rectSize][2];
      
      // Add the first placing position
      NODE zero = new NODE(0, 0);
      nodes.add(zero);
      nodeSize = 1;
      
      int currentWidth = 0;
      int currentHeight = 0;
      
      // ITERATE THROUGH ALL THE RECT
      for (int i = 0; i < rectSize; ++i) {
         int k = sortedIndexes[i];
         // ITERATE THROUGH ALL OF THE POSSIBLE POSITIONS
         int currentLeafNode = firstLeafPointer;
         // STORING THE POSITION WHERE THE AREA
         // GETS BIGGER AS LITTLE AS POSSIBLE
         int minArea = 99999999;
         int minAreaNode = -1;
         while (true) {
            NODE currentNode = nodes.get(currentLeafNode);
            
            int newWidth = currentWidth;
            int newHeight = currentHeight;
            
            if (currentNode.x + RECT[k][0] > currentWidth) {
               newWidth = currentNode.x + RECT[k][0];
            }
            
            if (currentNode.y + RECT[k][1] > currentHeight) {
               newHeight = currentNode.y + RECT[k][1];
            }
            
            // CHECK IF THE NEW WIDTH AND HEIGHT ARE IN BOUNDS
            if (newWidth <= W && newHeight <= H) {
               int newArea = newWidth * newHeight;
            
               if (minArea > newArea) {
                  // TEST IF ITS OVERLAPPING SOME RECT ALREADY PLACED
                  if (!testOverlapping(i, currentNode)) {
                     minArea = newArea;
                     minAreaNode = currentLeafNode;
                  }
               }
            }
            
            if (currentNode.nextLeaf == -1) break;
            currentLeafNode = currentNode.nextLeaf;
         }
         
         if (minAreaNode == -1) {
            RESULT[k][0] = width;
            RESULT[k][1] = height;
         } else {
            // PUT THE CURRENT BOX IN THE BEST POSITION
            NODE bestNode = nodes.get(minAreaNode);
            putBox(bestNode, k);
            
            // UPDATE CURRENT WIDHT AND HEIGHT
            currentWidth = max(currentWidth, bestNode.x + RECT[k][0]);
            currentHeight = max(currentHeight, bestNode.y + RECT[k][1]);
            
            // CREATE THE TWO NEW POSITIONS
            NODE newRight = new NODE(bestNode.x + RECT[k][0], bestNode.y);
            NODE newLeft = new NODE(bestNode.x, bestNode.y + RECT[k][1]);
            
            // SET THEM UP INTO THE LEAF ARRAY
            updateLinkedList(bestNode, newRight, newLeft);
            
            // CHANGE THE FIRST LEAF POINTER
            if (firstLeafPointer == minAreaNode) {
               firstLeafPointer = nodeSize;
            }
            
            // ADD THEM TO THE ARRAYLIST
            nodes.add(newRight);
            nodes.add(newLeft);
            
            // ADD THE REFERENCES TO THE BESTNODE
            // TODO: FURTHER USE THESE TO OPTIMIZE THE ALGORITHM
            bestNode.right = nodeSize;
            bestNode.left = nodeSize + 1;
            
            // INCREMENT THE NODE SIZE COUNTER
            nodeSize += 2;
         }
      }
   }
   
   private void putBox(NODE bestNode, int currentBoxPos) {
      RESULT[currentBoxPos][0] = bestNode.x;
      RESULT[currentBoxPos][1] = bestNode.y;
   }
   
   private void updateLinkedList(NODE bestNode, NODE newRight, NODE newLeft) {
      if (bestNode.prevLeaf != -1)
         nodes.get(bestNode.prevLeaf).nextLeaf = nodeSize;
      newRight.prevLeaf = bestNode.prevLeaf;
      newRight.nextLeaf = nodeSize + 1;
      newLeft.prevLeaf = nodeSize;
      newLeft.nextLeaf = bestNode.nextLeaf;
      if (bestNode.nextLeaf != -1)
         nodes.get(bestNode.nextLeaf).prevLeaf = nodeSize + 1;
   }
   
   private boolean testOverlapping(int rectNumber, NODE currentNode) {
      int k = sortedIndexes[rectNumber];
      int cx = currentNode.x;
      int cy = currentNode.y;
      int cw = RECT[k][0];
      int ch = RECT[k][1];
      
      for (int j = 0; j < rectNumber; ++j) {
         int jk = sortedIndexes[j];
         
         int jw = RECT[jk][0]; // input - width
         int jh = RECT[jk][1]; // input - height
         int jx = RESULT[jk][0]; // output - x
         int jy = RESULT[jk][1]; // output - y
                     
         if (cx < jx + jw && cy < jy + jh && cx + cw > jx && cy + ch > jy) {
            return true;
         }
      }
      
      return false;
   }
   
   private void calculateAreas() {
      rectSize = RECT.length;
      areas = new int[rectSize];
      for (int i = 0; i < rectSize; ++i) {
         areas[i] = RECT[i][0] * RECT[i][1];
      }
   }
   
   // SORT THE RECTS BY AREA
   private void sortAreas() {
      MERGESORT ms = new MERGESORT(areas, false);
      sortedIndexes = ms.RESULTINDEXES();
   }
   
   // NODE FOR THE PACKING ALGORITHM
   private class NODE {
      // IT STORES REFERENCES TO THE CHILD NODES
      // AND IT STORES ITS X AND Y POSITION
      int left = -1;
      int right = -1;
      int x, y;
      int prevLeaf = -1;
      int nextLeaf = -1;
      
      NODE(int x, int y) {
         this.x = x;
         this.y = y;
      }
   }
}