//%attributes = {}
If (False:C215)
	//Project Method Name:      ORD_COMtoComments
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/01/2013 12:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_ResultDescriptions; 0)
	C_BOOLEAN:C305($_bo_OK)
	C_LONGINT:C283($_l_DecriptionsIndex)
	C_TEXT:C284($_t_oldMethodName; ORD_t_CommentsonLoad)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("ORD_COMtoComments")

//••this needs testing its different to the older version••



$_t_oldMethodName:=ERR_MethodTracker("ORD_COMtoComments"; Form event code:C388)
ORD_t_CommentsonLoad:=""
If ([ORDERS:24]Order_Code:3#"")
	If ([ORDERS:24]Comments_2:40="")
		QUERY:C277([DIARY:12]; [DIARY:12]Action_Code:9="COM"; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Order_Code:26=[ORDERS:24]Order_Code:3)
		ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Time_Stamp:45; <)
		If (Records in selection:C76([DIARY:12])>0)
			
			SELECTION TO ARRAY:C260([DIARY:12]Result_Description:12; $_at_ResultDescriptions)
			[ORDERS:24]Comments_2:40:=""
			For ($_l_DecriptionsIndex; 1; Size of array:C274($_at_ResultDescriptions))
				$_bo_OK:=False:C215
				If ($_at_ResultDescriptions{$_l_DecriptionsIndex}#"")
					Repeat 
						If ($_at_ResultDescriptions{$_l_DecriptionsIndex}#"")
							If ($_at_ResultDescriptions{$_l_DecriptionsIndex}[[1]]=Char:C90(13))
								$_at_ResultDescriptions{$_l_DecriptionsIndex}:=Substring:C12($_at_ResultDescriptions{$_l_DecriptionsIndex}; 2)
							Else 
								$_bo_OK:=True:C214
							End if 
							
						End if 
					Until ($_at_ResultDescriptions{$_l_DecriptionsIndex}="") | ($_bo_OK)
					
					If ($_at_ResultDescriptions{$_l_DecriptionsIndex}#"")
						If ([ORDERS:24]Comments_2:40#"")
							[ORDERS:24]Comments_2:40:=[ORDERS:24]Comments_2:40+Char:C90(13)+$_at_ResultDescriptions{$_l_DecriptionsIndex}
						Else 
							[ORDERS:24]Comments_2:40:=$_at_ResultDescriptions{$_l_DecriptionsIndex}
							
						End if 
					End if 
				End if 
			End for 
		End if 
	End if 
End if 
ORD_t_CommentsonLoad:=[ORDERS:24]Comments_2:40
ERR_MethodTrackerReturn("ORD_COMtoComments"; $_t_oldMethodName)
