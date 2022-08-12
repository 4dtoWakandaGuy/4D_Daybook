//%attributes = {}
If (False:C215)
	//Project Method Name:      ORD_CommentstoCOM
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/01/2013 12:51
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_OK)
	C_TEXT:C284($_t_oldMethodName; ORD_t_CommentsonLoad)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ORD_CommentstoCOM"; Form event code:C388)

If (False:C215)
	If ([ORDERS:24]Comments_2:40#"")
		If (ORD_t_CommentsonLoad#"")
			[ORDERS:24]Comments_2:40:=Replace string:C233([ORDERS:24]Comments_2:40; ORD_t_CommentsonLoad; "")
		End if 
		$_bo_OK:=False:C215
		Repeat 
			If ([ORDERS:24]Comments_2:40#"")
				If ([ORDERS:24]Comments_2:40[[1]]=Char:C90(13))
					[ORDERS:24]Comments_2:40:=Substring:C12([ORDERS:24]Comments_2:40; 2)
				Else 
					$_bo_OK:=True:C214
				End if 
			End if 
		Until ([ORDERS:24]Comments_2:40="") | ($_bo_OK)
		
		Repeat 
			If ([ORDERS:24]Comments_2:40#"")
				If ([ORDERS:24]Comments_2:40[[Length:C16([ORDERS:24]Comments_2:40)]]=Char:C90(13))
					[ORDERS:24]Comments_2:40:=Substring:C12([ORDERS:24]Comments_2:40; 1; (Length:C16([ORDERS:24]Comments_2:40)-1))
					
				Else 
					$_bo_OK:=True:C214
				End if 
				
			End if 
		Until ([ORDERS:24]Comments_2:40="") | ($_bo_OK)
		If ([ORDERS:24]Comments_2:40#"")
			ORD_CommentstoDiary(->[ORDERS:24]Comments_2:40)
		End if 
		
	End if 
	
End if 
ERR_MethodTrackerReturn("ORD_CommentstoCOM"; $_t_oldMethodName)