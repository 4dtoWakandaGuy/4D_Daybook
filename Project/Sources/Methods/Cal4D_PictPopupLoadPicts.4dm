//%attributes = {"invisible":true,"shared":true}
If (False:C215)
	//Project Method Name:      Cal4D_PictPopupLoadPicts
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 15:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY PICTURE(<>Cal_api_EventPictures;0)
	//ARRAY PICTURE(<>Cal4D_api_EventPictures;0)
	ARRAY TEXT:C222($_at_DocumentNames; 0)
	C_LONGINT:C283($_l_DocumentIndex)
	C_PICTURE:C286($_pic_picture)
	C_TEXT:C284($_t_CalenderImagesFolder; Folder separator:K24:12; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_PictPopupLoadPicts")

// ----------------------------------------------------
// Project Method: Cal4D_PictPopupLoadPicts

// Reads the images from the files in the Images folder into a picture array.

// Access Type: Private

// Parameters: None

// Returns: Nothing

// Created by Dave Batton on Aug 5, 2004
// ----------------------------------------------------


ARRAY PICTURE:C279(<>Cal_api_EventPictures; 0)  // This is the array this method is designed to populate.


//Folder separator:=DB_DirSymbol 


$_t_CalenderImagesFolder:=Get 4D folder:C485(_o_Extras folder:K5:12)+"Cal4D_Images"+Folder separator:K24:12

// Make sure the folder exists. If not, just continue without any errors.
If (Test path name:C476($_t_CalenderImagesFolder)=Is a folder:K24:2)
	ARRAY TEXT:C222($_at_DocumentNames; 0)
	DOCUMENT LIST:C474($_t_CalenderImagesFolder; $_at_DocumentNames)
	SORT ARRAY:C229($_at_DocumentNames; >)  // Otherwise the images may change positions each time.
	
	For ($_l_DocumentIndex; 1; Size of array:C274($_at_DocumentNames))
		READ PICTURE FILE:C678($_t_CalenderImagesFolder+$_at_DocumentNames{$_l_DocumentIndex}; $_pic_picture)
		If (Error=0)
			APPEND TO ARRAY:C911(<>Cal_api_EventPictures; $_pic_picture)
		End if 
	End for 
	
End if 
ERR_MethodTrackerReturn("Cal4D_PictPopupLoadPicts"; $_t_oldMethodName)