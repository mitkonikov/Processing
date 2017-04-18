# Processing
Cool and Useful Projects in Processing. For every one of these projects, I will have a YouTube video explaining it in details on [My YouTube Channel](https://www.youtube.com/user/MitkoMr). 

If you have any questions or suggestions you can contact me on YouTube or on my email: mitkonikov01@gmail.com
I commented the code too, so always first read the comments before asking anything... _Thanks..._**

## Projects
The projects include multiple .pde files and everything that I have and I will be doing is going to be sorted in classes. I like Processing because It allows you to things like nested classes, functions... Also comparing the Object Oriented Features in Processing with O.O. Features in other popular languages, you are going to see great advantages in Processing...

### DRAGGABLE WINDOWS with Children
[on YouTube](https://www.youtube.com/watch?v=wyGXgp_uzV4)
![on YouTube](http://img.youtube.com/vi/wyGXgp_uzV4/0.jpg)

### MERGE SORT -- Keeping Track of Original Indexes
[on YouTube](https://www.youtube.com/watch?v=TcrTBinpLa8)
![on YouTube](http://img.youtube.com/vi/TcrTBinpLa8/0.jpg)
-- It is a very easy algorithm to understand compared to other sorting algorithms. I know that there is already algorithm/function for sorting elements in an array inside Processing, but the reason why I wrote it from scratch is to keep track of the original indexes. What does that mean?

---- Let's say we make an unsorted array of ints:
```processing
	int[] array = {3, 5, 1, 3, 2, 9, 8};
	// Indexes:    0  1  2  3  4  5  6
```
---- Than if we sort the array in the usual way you are going to get this new array:
```processing
	int[] sortedArray = {1, 2, 3, 3, 5, 8, 9};
```
---- And if you want to know the original index of 'for ex. 9', you would need to search the whole array once again needing O(n) operations... To match every number, you would need n*n => n^2 operations just to match the numbers after sorting...
---- The Ordinary MERGE SORT Algorithm has a complexity of _n log n_** and takes _2n_** memory
---- My MERGE SORT Algorithm with the ability to keep track of the original indexes has the same complexity of _n log n_** and takes _3n_** memory space.
---- So sorting the array using my MERGE SORT Algo. will give you:
```processing
	int[] sortedArray = {1, 2, 3, 3, 5, 8, 9};
	int[] indexes     = {2, 4, 0, 3, 1, 6, 5};
```
---- As you can see, it doesn't just sort the array, but it keeps track of the indexes too.

#### Why would you need it?
If you have an **ArrayList** of Objects and you need to sort them according some property, you would make an array of the values of that property and than you would just sort the newly created array. After that you can grab the "array of indexes" from the algorithm, and according to the indexes operate on the Objects.

### TEXTBOX
YouTube video is not uploaded...