//%attributes = {}
If (False:C215)
	//Project Method Name:      COM_CommentstoCOM
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/01/2013 12:48
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_OK)
	C_TEXT:C284($_t_oldMethodName; COM_t_CommentsonLoad)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("COM_CommentstoCOM")
If (False:C215)
	If ([COMPANIES:2]Comments:30#"")
		If (COM_t_CommentsonLoad#"")
			[COMPANIES:2]Comments:30:=Replace string:C233([COMPANIES:2]Comments:30; COM_t_CommentsonLoad; "")
		End if 
		$_bo_OK:=False:C215
		Repeat 
			If ([COMPANIES:2]Comments:30#"")
				If ([COMPANIES:2]Comments:30[[1]]=Char:C90(13))
					[COMPANIES:2]Comments:30:=Substring:C12([COMPANIES:2]Comments:30; 2)
				Else 
					$_bo_OK:=True:C214
				End if 
				
			End if 
		Until ([COMPANIES:2]Comments:30="") | ($_bo_OK)
		
		Repeat 
			If ([COMPANIES:2]Comments:30#"")
				If ([COMPANIES:2]Comments:30[[Length:C16([COMPANIES:2]Comments:30)]]=Char:C90(13))
					[COMPANIES:2]Comments:30:=Substring:C12([COMPANIES:2]Comments:30; 1; (Length:C16([COMPANIES:2]Comments:30)-1))
					
				Else 
					$_bo_OK:=True:C214
				End if 
				
			End if 
		Until ([COMPANIES:2]Comments:30="") | ($_bo_OK)
		
		
		If ([COMPANIES:2]Comments:30#"")
			COM_CommentstoDiary(->[COMPANIES:2]Comments:30)
		End if 
	End if 
	
End if 
ERR_MethodTrackerReturn("COM_CommentstoCOM"; $_t_oldMethodName)