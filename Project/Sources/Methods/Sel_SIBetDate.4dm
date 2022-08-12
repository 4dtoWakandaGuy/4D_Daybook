//%attributes = {}
If (False:C215)
	//Project Method Name:      Sel_SIBetDate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($4; $5)
	C_POINTER:C301($1; $2; $3)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel_SIBetDate")
//Sel_SIBetDate
If (($4>!00-00-00!) | ($5>!00-00-00!))
	Case of 
		: ($5=!00-00-00!)
			QUERY:C277($1->; $3->>=$4)
		: ($4=!00-00-00!)
			QUERY:C277($1->; $2-><=$5)
		: ($4=$5)
			QUERY:C277($1->; $3->=$4; *)
			QUERY:C277($1->;  | ; $2->=$4)
		Else 
			QUERY:C277($1->; $3->>=$4; *)
			QUERY:C277($1->;  & ; $3-><=$5)
			CREATE SET:C116($1->; "t1")
			QUERY:C277($1->; $2-><=$5; *)
			QUERY:C277($1->;  & ; $2->>=$4)
			CREATE SET:C116($1->; "t2")
			UNION:C120("t1"; "t2"; "t1")
			USE SET:C118("t1")
			CLEAR SET:C117("t1")
			CLEAR SET:C117("t2")
	End case 
	Master2($1)
End if 
ERR_MethodTrackerReturn("Sel_SIBetDate"; $_t_oldMethodName)
