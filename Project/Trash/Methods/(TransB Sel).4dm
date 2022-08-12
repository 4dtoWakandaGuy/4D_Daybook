//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      TransB Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 12:54
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vTr; xNext)
	C_TEXT:C284($_t_oldMethodName; $_t_Search; vSelPrev)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TransB Sel")
//TransB Sel
//DEFAULT TABLE([TRANS IN])

vTr:=1
If (vSelPrev="•FSC")
	TransB_SelP
Else 
	$_t_Search:=Gen_Search("Batch No or Date to view:"; vSelPrev; "Find Transaction Batches")
	If (OK=0)
		vTr:=0
	Else 
		If (xNext=0)
			vSelPrev:=$_t_Search
			TransB_Sel2($_t_Search)
		Else 
			TransB_SelP
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("TransB Sel"; $_t_oldMethodName)