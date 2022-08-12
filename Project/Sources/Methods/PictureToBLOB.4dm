//%attributes = {}
If (False:C215)
	//Project Method Name:      PictureToBLOB
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
	C_BLOB:C604($_blb_Blob; $0)
	C_PICTURE:C286($_pic_Picture; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PictureToBLOB")

If (False:C215)
	//************************************************************
	// PROJECT METHOD: PictureToBLOB
	
	// PARAMETERS: $0 = BLOB
	// $1 = picture
	
	// DESCRIPTION: extract BLOB data from a Picture variable
	
	// CREATED BY: Tim Nevels, Innovative Solutions ©2002
	// DATE: 6/24/2002
	// LAST MODIFIED:
End if   //**************************************************************

$_pic_Picture:=$1

VARIABLE TO BLOB:C532($_pic_Picture; $_blb_Blob)  //4D puts the same infos around  the 'picture'

SET BLOB SIZE:C606($_blb_Blob; BLOB size:C605($_blb_Blob)-6)  // strip off picture data  at the end
DELETE FROM BLOB:C560($_blb_Blob; 0; 9)  // strip off blob data from the beginning

$0:=$_blb_Blob
ERR_MethodTrackerReturn("PictureToBLOB"; $_t_oldMethodName)
