If (False:C215)
	//object Name: [ANALYSES]Analysis_In.Variable2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/01/2012 19:38
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ANN_abo_Backslash;0)
	//ARRAY BOOLEAN(ANN_abo_MultiNos;0)
	//ARRAY BOOLEAN(ANN_abo_officeCode;0)
	//ARRAY BOOLEAN(ANN_lb_LBFiles;0)
	//ARRAY INTEGER(ANN_ai_TableNumbers;0)
	//ARRAY INTEGER(ANN_al_LeadingZeros;0)
	//ARRAY LONGINT(ANN_al_Numbers;0)
	//ARRAY TEXT(ANN_at_IndentifierNames;0)
	C_LONGINT:C283($_l_Index; $_l_Retries; ANN_l_BUT1; ANN_l_But2; ANN_l_BUT3; ANN_l_BUT4; ANN_l_BUT5; ANN_l_BUT6; ANN_l_BUT7; ANN_l_BUT8; ANN_l_BUT9)
	C_LONGINT:C283(xSort)
	C_TEXT:C284($_t_oldMethodName; ANN_t_COL1; ANN_t_COL2; ANN_t_COL3; ANN_t_COL4; ANN_t_COL5; ANN_t_COL6; ANN_t_COL7; ANN_t_COL8; ANN_t_COL9; ANN_t_HED1)
	C_TEXT:C284(ANN_t_HED2; ANN_t_HED3; ANN_t_HED4; ANN_t_HED5; ANN_t_HED6; ANN_t_HED7; ANN_t_HED8; ANN_t_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ANALYSES].Analysis_In.Variable2"; Form event code:C388)
If ((xSort=1) & ([ANALYSES:36]Record_Number_Start:10=0))
	Gen_Confirm("Are you sure that you want to start using "+"Unique File Nos for this Analysis?"; "Yes"; "No")
	If (OK=1)
		READ WRITE:C146([IDENTIFIERS:16])
		$_l_Index:=5000
		$_l_Retries:=0
		While (($_l_Index<9000) & ([ANALYSES:36]Record_Number_Start:10=0))
			QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]Table_Number:1>=$_l_Index; *)
			QUERY:C277([IDENTIFIERS:16];  & ; [IDENTIFIERS:16]Table_Number:1<=($_l_Index+49))
			If (Records in selection:C76([IDENTIFIERS:16])=0)
				[ANALYSES:36]Record_Number_Start:10:=$_l_Index
				CREATE RECORD:C68([IDENTIFIERS:16])
				[IDENTIFIERS:16]Table_Number:1:=$_l_Index+4
				[IDENTIFIERS:16]Name:3:="Invoices"
				[IDENTIFIERS:16]Multiple_Numbers:7:=True:C214
				DB_SaveRecord(->[IDENTIFIERS:16])
				
				Gen_CodeCreate([IDENTIFIERS:16]Table_Number:1)
				CREATE RECORD:C68([IDENTIFIERS:16])
				[IDENTIFIERS:16]Table_Number:1:=$_l_Index+19
				[IDENTIFIERS:16]Name:3:="Proformas"
				[IDENTIFIERS:16]Multiple_Numbers:7:=True:C214
				DB_SaveRecord(->[IDENTIFIERS:16])
				Gen_CodeCreate([IDENTIFIERS:16]Table_Number:1)
				CREATE RECORD:C68([IDENTIFIERS:16])
				[IDENTIFIERS:16]Table_Number:1:=$_l_Index+25
				[IDENTIFIERS:16]Name:3:="Credit Notes"
				[IDENTIFIERS:16]Multiple_Numbers:7:=True:C214
				DB_SaveRecord(->[IDENTIFIERS:16])
				Gen_CodeCreate([IDENTIFIERS:16]Table_Number:1)
			End if 
			$_l_Index:=$_l_Index+50
		End while 
		If ([ANALYSES:36]Record_Number_Start:10=0)
			Gen_Alert("Too many Analyses have been used")
			xSort:=0
			REDUCE SELECTION:C351([IDENTIFIERS_MULTI_NUMBERS:94]; 0)
		Else 
			QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]Table_Number:1>=[ANALYSES:36]Record_Number_Start:10; *)
			QUERY:C277([IDENTIFIERS:16];  & ; [IDENTIFIERS:16]Table_Number:1<=([ANALYSES:36]Record_Number_Start:10+49))
			DB_SaveRecord(->[ANALYSES:36])
			READ WRITE:C146([IDENTIFIERS:16])
		End if 
	End if 
	OBJECT SET VISIBLE:C603(ANN_lb_LBFiles; True:C214)
Else 
	Gen_Confirm("Are you sure that you want to stop to using "+"Unique File Nos for this Analysis?"; "Yes"; "No")
	If (OK=1)
		If ([ANALYSES:36]Record_Number_Start:10>0)
			QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]Table_Number:1>=[ANALYSES:36]Record_Number_Start:10; *)
			QUERY:C277([IDENTIFIERS:16];  & ; [IDENTIFIERS:16]Table_Number:1<=([ANALYSES:36]Record_Number_Start:10+49))
			DELETE SELECTION:C66([IDENTIFIERS:16])
			QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1>=[ANALYSES:36]Record_Number_Start:10; *)
			QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94];  & ; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1<=([ANALYSES:36]Record_Number_Start:10+49))
			DELETE SELECTION:C66([IDENTIFIERS_MULTI_NUMBERS:94])
			[ANALYSES:36]Record_Number_Start:10:=0
			OBJECT SET VISIBLE:C603(ANN_lb_LBFiles; False:C215)
		End if 
	End if 
End if 
SELECTION TO ARRAY:C260([IDENTIFIERS:16]Table_Number:1; ANN_ai_TableNumbers; [IDENTIFIERS:16]Name:3; ANN_at_IndentifierNames; [IDENTIFIERS:16]Number:2; ANN_al_Numbers; [IDENTIFIERS:16]Office_Code:4; ANN_abo_officeCode; [IDENTIFIERS:16]Backslash:5; ANN_abo_Backslash; [IDENTIFIERS:16]Leading_Zeros:6; ANN_al_LeadingZeros; [IDENTIFIERS:16]Multiple_Numbers:7; ANN_abo_MultiNos)

LB_SetupListbox(->ANN_lb_LBFiles; "ANN_t"; "ANN_L"; 1; ->ANN_ai_TableNumbers; ->ANN_at_IndentifierNames; ->ANN_al_Numbers; ->ANN_abo_officeCode; ->ANN_abo_Backslash; ->ANN_al_LeadingZeros; ->ANN_abo_MultiNos)


LB_SetColumnHeaders(->ANN_lb_LBFiles; "ANN_L"; 1; "Table"; "Name"; "Next Number"; "Use Office Code"; "Use Backslash"; "Insert leading zeros"; "Create multi-numbers")

LB_SetColumnWidths(->ANN_lb_LBFiles; "ANN_t"; 1; 40; 50; 50; 20; 20; 40; 20)
LB_SetEnterable(->ANN_lb_LBFiles; False:C215; 0)
LB_SetEnterable(->ANN_lb_LBFiles; True:C214; 3)
LB_SetEnterable(->ANN_lb_LBFiles; True:C214; 4)
LB_SetEnterable(->ANN_lb_LBFiles; True:C214; 5)
LB_SetEnterable(->ANN_lb_LBFiles; True:C214; 6)
LB_SetEnterable(->ANN_lb_LBFiles; True:C214; 7)
LB_SetScroll(->ANN_lb_LBFiles; -2; -2)
LB_StyleSettings(->ANN_lb_LBFiles; "Black"; 9; "ANN_t"; ->[ACCOUNTS:32])
ERR_MethodTrackerReturn("OBJ:Analysis_In,xSort"; $_t_oldMethodName)
