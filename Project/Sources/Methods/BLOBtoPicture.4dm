//%attributes = {}
If (False:C215)
	//Project Method Name:      BLOBtoPicture
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604($_blb_PictureBlob; $1)
	C_LONGINT:C283($_l_BlobSize)
	C_PICTURE:C286($_pic_Picture; $0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("BLOBtoPicture")

If (False:C215)
	//************************************************************
	// PROJECT METHOD: BLOBtoPicture
	
	// PARAMETERS: $0 = picture
	// $1 = BLOB
	
	// DESCRIPTION: Put BLOB data into a Picture variable
	
	// CREATED BY: Tim Nevels, Innovative Solutions ©2002
	// DATE: 6/24/2002
	// LAST MODIFIED:
End if   //**************************************************************


$_blb_PictureBlob:=$1

$_l_BlobSize:=BLOB size:C605($_blb_PictureBlob)+6  //Increase the end by 6 bytes

If ($_l_BlobSize=6)  // BLOB is empty
	SET BLOB SIZE:C606($_blb_PictureBlob; 9; 0)
Else 
	INSERT IN BLOB:C559($_blb_PictureBlob; 0; 9; 0)  //adds info at the beginning
End if 

//If (◊MacOS)
If (Is macOS:C1572)
	$_blb_PictureBlob{0}:=Character code:C91("B")
	$_blb_PictureBlob{1}:=Character code:C91("L")
	$_blb_PictureBlob{2}:=Character code:C91("V")
	$_blb_PictureBlob{3}:=Character code:C91("R")
	$_blb_PictureBlob{4}:=0x000A  //for the variable type
	$_blb_PictureBlob{5}:=($_l_BlobSize\16777216)
	$_blb_PictureBlob{6}:=($_l_BlobSize\65536)%256
	$_blb_PictureBlob{7}:=($_l_BlobSize\256)%256
	$_blb_PictureBlob{8}:=$_l_BlobSize%256
Else   // Windows
	$_blb_PictureBlob{0}:=Character code:C91("R")
	$_blb_PictureBlob{1}:=Character code:C91("V")
	$_blb_PictureBlob{2}:=Character code:C91("L")
	$_blb_PictureBlob{3}:=Character code:C91("B")
	$_blb_PictureBlob{4}:=0x000A  //for the variable type
	$_blb_PictureBlob{5}:=$_l_BlobSize%256
	$_blb_PictureBlob{6}:=($_l_BlobSize\256)%256
	$_blb_PictureBlob{7}:=($_l_BlobSize\65536)%256
	$_blb_PictureBlob{8}:=($_l_BlobSize\16777216)
End if 

// add picture data to end of the BLOB
INTEGER TO BLOB:C548(0x0000; $_blb_PictureBlob; Macintosh byte ordering:K22:2; *)
INTEGER TO BLOB:C548(0x0000; $_blb_PictureBlob; Macintosh byte ordering:K22:2; *)
INTEGER TO BLOB:C548(0x0000; $_blb_PictureBlob; Macintosh byte ordering:K22:2; *)

BLOB TO VARIABLE:C533($_blb_PictureBlob; $_pic_Picture)  //now we can move the blob into  the picture

$0:=$_pic_Picture
ERR_MethodTrackerReturn("BLOBtoPicture"; $_t_oldMethodName)