// code written by Mitko Nikov

// UNSORTED (ORIGINAL) ARRAY of size 7
// INDEXES :      0  1  2  3  4  5  6
int[] unsorted = {3, 5, 1, 3, 2, 9, 8};

int[] result;
int[] resultIndexes;

void setup() {
   size(400, 300);
   
   // CREATING A MERGESORT OBJECT
   MERGESORT ms = new MERGESORT(unsorted);
   
   // GRAB THE RESULTS
   result = ms.RESULT();
   resultIndexes = ms.RESULTINDEXES();
}

void draw() {
   background(100);
   textSize(24);
   
   // DISPLAY THE UNSORTED ARRAY
   text("unsorted = {", 50, 30);
   for (int i = 0; i < unsorted.length; ++i) {
      text(unsorted[i] + " ", 200 + (i * 20), 30);
   }
   text("};", 180 + ((unsorted.length + 1) * 20), 30);
   
   // DISPLAY THE SORTED ARRAY
   for (int i = 0; i < result.length; ++i) {
      String str = result[i] + " with original index at " + resultIndexes[i];
      text(str, 50, 70 + (i * 30));
   }
}