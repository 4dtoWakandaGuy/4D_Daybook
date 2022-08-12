//%attributes = {}
If (False:C215)
	//Project Method Name:      TransB_Sel2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  12/06/2010 12:54
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CharacterPosition)
	C_TEXT:C284($_t_oldMethodName; $_t_Search; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TransB_Sel2")
If (Count parameters:C259>=1)
	$_t_Search:=$1
	If (((Length:C16($_t_Search)=1) & (Character code:C91($_t_Search)=64)) | ($_t_Search=""))
		ALL RECORDS:C47([TRANSACTION_BATCHES:30])
	Else 
		$_l_CharacterPosition:=Position:C15("/"; $_t_Search)
		If (Num:C11($_t_Search)>0) & ($_l_CharacterPosition=0)
			QUERY:C277([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]Batch_Number:10=Num:C11($_t_Search); *)
			If (Date:C102($_t_Search)#!00-00-00!)
				QUERY:C277([TRANSACTION_BATCHES:30];  | ; [TRANSACTION_BATCHES:30]Batch_Date:1=Date:C102($_t_Search))
			Else 
				QUERY:C277([TRANSACTION_BATCHES:30])
				
			End if 
		Else 
			If (Date:C102($_t_Search)#!00-00-00!)
				QUERY:C277([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]Batch_Date:1=Date:C102($_t_Search))
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("TransB_Sel2"; $_t_oldMethodName)
