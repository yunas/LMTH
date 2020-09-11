Localized Multi Texton Histogram
====

Content based image retrival using Localized Multi Texton Histogram.

In code block term `localized` is used to represent `Blocks` ps. the orientation from 0 ~ 360 is presented as 36 or nothing and orientations from 0 ~ 180 are presented as 18.    

*3 approaches are provided in the code:*    
1. MTH  (By Original Author)    
2. LMTH (Proposed)    
3. MTH  (Modified Using Canny => runs on approach 1)     
     
**Pre-requisite:**
You need to setup the databse before you can try out the code:
    
**Create Database:**    
//============================ APPROACH 1 ============================    
    
Command : CreateTextonDB ('path')   
Example : `CreateTextonDB ('/Users/Desktop/implementation/images/image.orig')`
     
//============================ APPROACH 2 ============================     
     
Command : BlockMTH_CreateBlockedTextonDB ('path')     
Example : `BlockMTH_CreateBlockedTextonDB ('/Users/Desktop/implementation/images/image.orig')`

Command : BlockMTH_Canny_18_CreateBlockedTextonDB ('path')    
Example : `BlockMTH_Canny_18_CreateBlockedTextonDB ('/Users/Desktop/implementation/images/image.orig')`
     
//============================ APPROACH 3 ============================    
     
Command : Canny_36_Create_MTH_DB ('path')    
Example : `Canny_36_Create_MTH_DB ('/Users/Desktop/implementation/images/image.orig')`
    
Command : Canny_18_Create_MTH_DB ('path')    
Example : `Canny_18_Create_MTH_DB ('/Users/Desktop/implementation/images/image.orig')`
    
//============================ CREATE DATABASE CODE ENDS HERE ============================    
    
**SEARCH IMAGE:**
    
//============================ APPROACH 1 ============================   
    
`MTH_SearchImage('imageName')`
    
//============================ APPROACH 2 ============================   
   
`BlockMTH_Canny_18_SearchImage ('imageName')`
`BlockMTH_SearchImage ('imageName')`

//============================ APPROACH 3 ============================

`Canny_36_SearchImage ('imageName')`
`Canny_18_SearchImage ('imageName')`


**DEMO**
Trained database files are already setup and added to the repo:
1. MTH_Test1000_DB
2. MTH_Block_Test1000_DB.mat
3. MTH_Block_Canny_18_Test1000_DB.mat
4. MTH_Canny_36_Test1000_DB.mat
5. MTH_Canny_18_Test1000_DB.mat

Each approach uses its own dataset, for demo purpose you need to run the following command: 
`BlockMTH_SearchImage ('433.jpg')`
