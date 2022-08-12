If (False:C215)
	//object Name: [COMPANIES]dStatsView13.Variable9
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($bd13; bd13; bd14)
	C_TEXT:C284($_t_oldMethodName; $Def)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dStatsView13.Variable9"; Form event code:C388)

$bd13:=bd13
If (bd13=1)
	If (bd14>0)
		$Def:=String:C10(bd14)
	Else 
		$Def:="1"
	End if 
	bd14:=Num:C11(Gen_Request("Number of characters:"; $Def))
	If ((bd14=0) | (OK=0))
		bd13:=0
	Else 
		If (bd14>30)
			Gen_Alert("The maximum is 30"; "")
			bd14:=30
		End if 
	End if 
End if 

If ($bd13=bd13)
	StatsView_Cal1
End if 
If (bd14=0)
	OBJECT SET TITLE:C194(bd13; "x Chars")
Else 
	If (bd14=1)
		OBJECT SET TITLE:C194(bd13; "1 Char")
	Else 
		OBJECT SET TITLE:C194(bd13; String:C10(bd14)+" Chars")
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dStatsView13.Variable9"; $_t_oldMethodName)
