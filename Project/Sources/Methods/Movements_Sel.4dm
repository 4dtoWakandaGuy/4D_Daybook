//%attributes = {}
If (False:C215)
	//Project Method Name:      Movements_Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 13:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vPu; xNext)
	C_TEXT:C284($_t_oldMethodName; $_t_Search; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; VSELPREV)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Movements_Sel")
//Movements_Sel
//DEFAULT TABLE([STOCK MOVEMENTS])
vPu:=1
If (vSelPrev="•FSC")
	Movements_SelP
Else 
	If ((DB_t_CurrentFormUsage#"AC") & (DB_t_CurrentFormUsage#"Pay"))
		$_t_Search:=Gen_Search("Movt Code, Type, Company or Date:"; vSelPrev; "Find Stock Movements")
		If (OK=1)
			If (xNext=0)
				vSelPrev:=$_t_Search
				Movements_Sel2($_t_Search)
			Else 
				Movements_SelP
			End if 
		Else 
			vPu:=0
		End if 
	Else 
		Movements_SelP
	End if 
End if 
ERR_MethodTrackerReturn("Movements_Sel"; $_t_oldMethodName)