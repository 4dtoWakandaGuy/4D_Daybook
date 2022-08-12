//%attributes = {}
If (False:C215)
	//Project Method Name:      COM_COMtoComments
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/01/2013 12:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_ResultDescriptions; 0)
	C_BOOLEAN:C305($_bo_OK)
	C_LONGINT:C283($_l_Index)
	C_TEXT:C284($_t_oldMethodName; COM_t_CommentsonLoad)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("COM_COMtoComments")
If (False:C215)
	COM_t_CommentsonLoad:=""
	If ([COMPANIES:2]x_ID:63>0)
		If ([COMPANIES:2]Comments:30="")
			QUERY:C277([DIARY:12]; [DIARY:12]Action_Code:9="COM"; *)
			QUERY:C277([DIARY:12];  & ; [DIARY:12]Company_Code:1=[COMPANIES:2]Company_Code:1; *)
			QUERY:C277([DIARY:12];  & ; [DIARY:12]Order_Code:26="")
			ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Time_Stamp:45; <)
			If (Records in selection:C76([DIARY:12])>0)
				
				SELECTION TO ARRAY:C260([DIARY:12]Result_Description:12; $_at_ResultDescriptions)
				[COMPANIES:2]Comments:30:=""
				For ($_l_Index; 1; Size of array:C274($_at_ResultDescriptions))
					If ($_at_ResultDescriptions{$_l_Index}#"")
						$_bo_OK:=False:C215
						Repeat 
							If ($_at_ResultDescriptions{$_l_Index}#"")
								If ($_at_ResultDescriptions{$_l_Index}[[1]]=Char:C90(13))
									$_at_ResultDescriptions{$_l_Index}:=Substring:C12($_at_ResultDescriptions{$_l_Index}; 2)
								Else 
									$_bo_OK:=True:C214
								End if 
								
							End if 
						Until ($_at_ResultDescriptions{$_l_Index}="") | ($_bo_OK)
						If ($_at_ResultDescriptions{$_l_Index}#"")
							If ([COMPANIES:2]Comments:30#"")
								[COMPANIES:2]Comments:30:=[COMPANIES:2]Comments:30+Char:C90(13)+$_at_ResultDescriptions{$_l_Index}
							Else 
								[COMPANIES:2]Comments:30:=$_at_ResultDescriptions{$_l_Index}
							End if 
						End if 
					End if 
				End for 
			End if 
		End if 
	End if 
	COM_t_CommentsonLoad:=[COMPANIES:2]Comments:30
End if 
ERR_MethodTrackerReturn("COM_COMtoComments"; $_t_oldMethodName)