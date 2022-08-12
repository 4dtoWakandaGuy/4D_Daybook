//%attributes = {}
If (False:C215)
	//Project Method Name:      Acc_BalPage
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/11/2012 14:23
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_LineIndex; $_l_maxLInes; $_l_PrintHeight; $1; $2; $4; ch6; PRT_l_BottomMargin; PRT_l_MaxHeight; PRT_l_RemainingHeight; vPage)
	C_TEXT:C284($_t_oldMethodName; $3; vPPage)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Acc_BalPage")
If (Count parameters:C259>=2)
	$_l_LineIndex:=$_l_LineIndex+$2
	If ($1=1)
		$_l_maxLInes:=40
	Else 
		$_l_maxLInes:=51
	End if 
	
	
	If ($_l_LineIndex>$_l_maxLInes) | (PRT_l_RemainingHeight<=PRT_l_BottomMargin)
		PAGE BREAK:C6(>)
		vPage:=vPage+1
		vPPage:="Page "+String:C10(vPage)
		$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "All_Hdr"; 200)
		PRT_l_RemainingHeight:=PRT_l_MaxHeight-$_l_PrintHeight
		If (Count parameters:C259<4)
			$_l_PrintHeight:=Print form:C5([HEADINGS:84]; $3)
		Else 
			$_l_PrintHeight:=Print form:C5([HEADINGS:84]; $3; $4)
		End if 
		
		PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
		$_l_LineIndex:=9
		If (ch6=1)
			$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "All_Gap"; Form detail:K43:1)
			PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
			$_l_LineIndex:=$_l_LineIndex+1
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Acc_BalPage"; $_t_oldMethodName)
