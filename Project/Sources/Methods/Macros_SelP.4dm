//%attributes = {}
If (False:C215)
	//Project Method Name:      Macros_SelP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 21:45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	//ARRAY TEXT(<>DB_at_TableNames;0)
	//ARRAY TEXT(SRProdCode;0)
	C_BOOLEAN:C305(WIN_bo_TrackerInited)
	C_DATE:C307(vSDateF; vSDateT)
	C_LONGINT:C283($_l_Index; $_l_NumberofTables; $_l_OK; $_l_WindowReferenceRow; $_l_WIndowReference; iNoDear; iNoSal; r1; r2; s1; s2)
	C_LONGINT:C283(SRCH_l_And; SRCH_l_Not; SRCH_l_or; vP; WIN_l_CurrentWinRef)
	C_POINTER:C301(vFilePtr)
	C_TEXT:C284($_t_oldMethodName; vComments; vCompCode; vCompName; vGroup; vSales; VSELPREV; vTown)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macros_SelP")
//Contracts_SelP
//DEFAULT TABLE([MACROS])
Sel_Beginning(False:C215; ->[SCRIPTS:80])
While ((vP=1) & ((SRCH_l_And=1) | (SRCH_l_or=1) | (SRCH_l_Not=1)))
	Sel_Beginning2(False:C215; ->[SCRIPTS:80])
	
	If (vSelPrev#"•FSC")
		vCompCode:=""
		vCompName:=""
		vTown:=""
		vSales:=""
		vComments:=""
		vGroup:=""
		vSDateF:=!00-00-00!
		vSDateT:=!00-00-00!
		vFilePtr:=->[SCRIPTS:80]
		
		$_l_NumberofTables:=Size of array:C274(<>DB_at_TableNames)
		ARRAY TEXT:C222(SRProdCode; $_l_NumberofTables)
		For ($_l_Index; 1; $_l_NumberofTables)
			SRProdCode{$_l_Index}:=<>DB_at_TableNames{$_l_Index}
		End for 
		INSERT IN ARRAY:C227(SRProdCode; 1; 1)
		SRProdCode{1}:="Unspecified"
		INSERT IN ARRAY:C227(SRProdCode; 1; 1)
		SRProdCode{1}:="No search"
		SRProdCode:=1
	End if 
	Open_AnyTypeWindow(277; 428; 4; "Find Macros")
	DIALOG:C40([SCRIPTS:80]; "dScripts_Sel")
	CLOSE WINDOW:C154
	$_l_OK:=OK
	OK:=1
	If (WIN_bo_TrackerInited)
		$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
		If ($_l_WindowReferenceRow>0)
			WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
		End if 
	End if 
	
	If ($_l_OK=0)
		vP:=0
	Else 
		Sel_S(->[SCRIPTS:80]; ->[SCRIPTS:80]Script_Code:1; vCompCode)
		Sel_S(->[SCRIPTS:80]; ->[SCRIPTS:80]Keystroke:3; vTown)
		Sel_S(->[SCRIPTS:80]; ->[SCRIPTS:80]Person:5; vSales)
		Sel_S(->[SCRIPTS:80]; ->[SCRIPTS:80]Script_Group:9; vGroup)
		Sel_SIDate(->[SCRIPTS:80]; ->[SCRIPTS:80]Modified_Date:10; vSDateF; vSDateT)
		If (iNoDear=1)
			QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Same_Process:6=True:C214)
			Master2(->[SCRIPTS:80])
			s1:=1
			r1:=1
			s2:=0
			r2:=0
		End if 
		If (iNoSal=1)
			QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Same_Process:6=False:C215)
			Master2(->[SCRIPTS:80])
			s1:=0
			r1:=0
			s2:=1
			r2:=1
		End if 
		If (SRProdCode#1)
			QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Table_Number:8=(SRProdCode-2))
			Master2(->[SCRIPTS:80])
		End if 
		Sel_SIS
		Sel_SSStrSin(->[SCRIPTS:80]; ->[SCRIPTS:80]Script_Name:2; vCompName)
		If (vComments#"")
			Sel_SSStrSin(->[SCRIPTS:80]; ->[SCRIPTS:80]Recording_Text:4; "@"+vComments+"@")
		End if 
		
		Big_One(->[SCRIPTS:80])
		
	End if 
End while 
Sel_Ending
ERR_MethodTrackerReturn("Macros_SelP"; $_t_oldMethodName)