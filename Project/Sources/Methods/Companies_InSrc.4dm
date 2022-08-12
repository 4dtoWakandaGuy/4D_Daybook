//%attributes = {}
If (False:C215)
	//Project Method Name:      Companies_InSrc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $CA; $_t_CompName; $Postcode; $Town; vCompName; vPostcode; vTown)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Companies_InSrc")
ALL RECORDS:C47([COMPANIES:2])
If (vCompName#"")
	QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=vCompName)
	If (Records in selection:C76([COMPANIES:2])=0)
		$_t_CompName:=Substring:C12(vCompname; 1; 10)+"@"
		QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Name:2=$_t_CompName; *)
		QUERY:C277([COMPANIES:2];  | ; [COMPANIES:2]Also_Known_As:43=$_t_CompName; *)
		$CA:=Companies_Abbr($_t_CompName)+"@"
		QUERY:C277([COMPANIES:2];  | ; [COMPANIES:2]Company_Abbreviated_Name:52=$CA)
	End if 
End if 
If (vTown#"")
	$Town:=Substring:C12(vTown; 1; 5)+"@"
	QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Town_or_City:5=$Town)
End if 
If (vPostcode#"")
	$Postcode:=Sel_AtSign(Substring:C12(vPostcode; 1; 20))
	QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Postal_Code:7=$Postcode)
End if 
ERR_MethodTrackerReturn("Companies_InSrc"; $_t_oldMethodName)