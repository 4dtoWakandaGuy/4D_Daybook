//%attributes = {}
If (False:C215)
	//Project Method Name:      Acc_BalPage12
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_PrintHeight; $1; $2; $l; ch6; i; PRT_l_MaxHeight; PRT_l_RemainingHeight; vPage)
	C_TEXT:C284($_t_oldMethodName; $3; vPPage)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Acc_BalPage12")
If (Count parameters:C259>=2)
	i:=i+$2
	If ($1=1)
		$l:=40
	Else 
		$l:=49
	End if 
	If (i>$l)
		PAGE BREAK:C6(>)
		vPage:=vPage+1
		vPPage:="Page "+String:C10(vPage)
		
		$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "All_Hdr12")
		PRT_l_RemainingHeight:=PRT_l_MaxHeight-$_l_PrintHeight
		
		$_l_PrintHeight:=Print form:C5([HEADINGS:84]; $3)
		PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
		i:=7
		If (ch6=1)
			
			$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "All_Gap12")
			PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
			i:=i+1
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Acc_BalPage12"; $_t_oldMethodName)
