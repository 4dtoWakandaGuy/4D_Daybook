//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_PictureSetup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(EW_at_FolderPathName;0)
	//ARRAY TEXT(EW_at_PicturePath;0)
	C_BOOLEAN:C305(yHasPics)
	C_LONGINT:C283($_l_SelectedRow; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_Path; EW_PicType; tlocalFolderPath)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_PictureSetup")
// EW_PictureSetup
// Sets up picture details for BK exports
// 18/11/03 pb
// parameters: $1 = the current element number

$_l_SelectedRow:=$1

Case of 
	: ([CATALOGUE:108]Image_Source:3=1)  // "On Disk"
		Case of 
			: ([CATALOGUE:108]Image_NamePref:5=1)  //"Use Product Code"
				EW_at_PicturePath{$_l_SelectedRow}:=[PRODUCTS:9]Product_Code:1
				yHasPics:=True:C214
			: ([CATALOGUE:108]Image_NamePref:5=2)  //"Use Product Short Code"
				EW_at_PicturePath{$_l_SelectedRow}:=[PRODUCTS:9]Short_Code:19
				yHasPics:=True:C214
			: ([CATALOGUE:108]Image_NamePref:5=3)  //"Use Image Name on Product"
				EW_at_PicturePath{$_l_SelectedRow}:=[PRODUCTS:9]Picture_File_Name:44
				yHasPics:=True:C214
		End case 
		If (Find in array:C230(EW_at_FolderPathName; [CATALOGUE:108]Image_Path:4)<1)
			EW_at_FolderPathName{$_l_SelectedRow}:=[CATALOGUE:108]Image_Path:4
		End if 
		
	: ([CATALOGUE:108]Image_Source:3=2)  //"In Database"
		// get the picture out of the database and save it to disk
		QUERY:C277([PICTURES:85]; [PICTURES:85]LinkedTableID:6=Table:C252(->[PRODUCTS:9]); *)
		QUERY:C277([PICTURES:85];  & ; [PICTURES:85]LinkedRecordID:7=[PRODUCTS:9]X_ID:43)
		If (Records in selection:C76([PICTURES:85])>0)
			$_t_Path:=tlocalFolderPath+[PICTURES:85]Picture_Name:2
			If (Test path name:C476($_t_Path)#Is a document:K24:1)
				WRITE PICTURE FILE:C680($_t_Path; [PICTURES:85]Picture:3; EW_PicType)
			End if 
			EW_at_PicturePath{$_l_SelectedRow}:=[PICTURES:85]Picture_Name:2
		End if 
		yHasPics:=True:C214
	Else 
		// well then there is no picture is there?
End case 
ERR_MethodTrackerReturn("EW_PictureSetup"; $_t_oldMethodName)