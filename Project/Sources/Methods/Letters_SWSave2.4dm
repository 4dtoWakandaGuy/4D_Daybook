//%attributes = {}
If (False:C215)
	//Project Method Name:      Letters_SWSave2
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
	//ARRAY TEXT(<>Per_at_PersonnelNames;0)
	C_BOOLEAN:C305($_bo_Replace; DB_bo_RecordModified)
	C_LONGINT:C283(Write; xNext)
	C_PICTURE:C286($_pic_4DWrite)
	C_TEXT:C284(<>SYS_t_4DWriteType; $_t_oldMethodName; vTitle1; vTitle2; vType)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letters_SWSave2")
//Letters_SWSave2
If (vTitle1="")
	Gen_Alert("Please specify a Document Code"; "Try again")
Else 
	QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=vTitle1)
	OK:=1
	$_bo_Replace:=False:C215
	If (Records in selection:C76([DOCUMENTS:7])>0)
		Gen_Confirm("That Document already exists"+", created by "+([DOCUMENTS:7]Person:10*Num:C11([DOCUMENTS:7]Person:10#""))+", Type "+[DOCUMENTS:7]Document_Type:13+".  Do you want to replace it?"; "Replace"; "Cancel")
		If (OK=1)
			$_bo_Replace:=True:C214
		End if 
	End if 
	If (OK=1)
		If (DB_bo_RecordModified)
			POP RECORD:C177([DOCUMENTS:7])
			If (([DOCUMENTS:7]Document_Code:1#"*TMP@") & ($_bo_Replace=False:C215))
				CREATE RECORD:C68([DOCUMENTS:7])
			Else 
				If ($_bo_Replace)
					QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=vTitle1)
				End if 
			End if 
		Else 
			If ($_bo_Replace=False:C215)
				CREATE RECORD:C68([DOCUMENTS:7])
			End if 
		End if 
		[DOCUMENTS:7]Document_Code:1:=vTitle1
		[DOCUMENTS:7]Heading:2:=vTitle2
		[DOCUMENTS:7]Document_Type:13:=vType
		[DOCUMENTS:7]Person:10:=<>Per_at_PersonnelNames{<>Per_at_PersonnelNames}
		If (xNext=1)
			[DOCUMENTS:7]Standard:9:=True:C214
		Else 
			[DOCUMENTS:7]Standard:9:=False:C215
		End if 
		If (<>SYS_t_4DWriteType="WS")  // 4DWrite "Silver"
			
			//$p:=  Area to picture (Write)
			//NG April 2000 update to 4D write 655-replaced above command
			//For ease I am sending the 'assume doc saved(param 2) it would be better if
			//we knew if the doc was saved so we could choose to display dialog
			$_pic_4DWrite:=WR Area to picture:P12000:139(Write; 1; 0)
			
			//   Else
			//    $r:=SW Get Area (Write;$_pic_4DWrite)` SuperWrite out 24/04/02 pb
		End if 
		[DOCUMENTS:7]Write_:5:=$_pic_4DWrite
		DB_SaveRecord(->[DOCUMENTS:7])
		PUSH RECORD:C176([DOCUMENTS:7])
		ADD TO SET:C119([DOCUMENTS:7]; "Master")
		USE SET:C118("Master")
		POP RECORD:C177([DOCUMENTS:7])
		ACCEPT:C269
	End if 
End if 
ERR_MethodTrackerReturn("Letters_SWSave2"; $_t_oldMethodName)