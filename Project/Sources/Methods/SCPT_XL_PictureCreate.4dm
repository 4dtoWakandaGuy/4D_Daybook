//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_XL_PictureCreate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/06/2013 15:34
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285($4; $5; $6; $7)
	C_TEXT:C284($_t_oldMethodName; $0; $1; $2; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL_PictureCreate")


SCPT_XL_SetParameter("XCEL_WORKBOOK_NAME"; $1)
SCPT_XL_SetParameter("XCEL_SHEET_NAME"; $2)
SCPT_XL_SetParameter("XCEL_PICTURE_FILE_NAME"; $3)
SCPT_XL_SetParameter("XCEL_PICTURE_LEFT"; String:C10($4))
SCPT_XL_SetParameter("XCEL_PICTURE_TOP"; String:C10($5))
SCPT_XL_SetParameter("XCEL_PICTURE_WIDTH"; String:C10($6))
SCPT_XL_SetParameter("XCEL_PICTURE_HEIGHT"; String:C10($7))

$0:=SCPT_XL("sheet_picture_create")
ERR_MethodTrackerReturn("SCPT_XL_PictureCreate"; $_t_oldMethodName)