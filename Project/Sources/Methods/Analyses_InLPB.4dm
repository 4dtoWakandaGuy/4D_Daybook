//%attributes = {}
If (False:C215)
	//Project Method Name:      Analyses_InLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 14:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ANN_abo_Backslash;0)
	//ARRAY BOOLEAN(ANN_abo_MultiNos;0)
	//ARRAY BOOLEAN(ANN_abo_OfficeCode;0)
	//ARRAY BOOLEAN(ANN_lb_LBFiles;0)
	//ARRAY INTEGER(ANN_aI_FileNo;0)
	//ARRAY INTEGER(ANN_ai_LeadingZeros;0)
	//ARRAY LONGINT(ANN_al_Number;0)
	//ARRAY TEXT(ANN_at_FileName;0)
	C_LONGINT:C283(ANN_l_BUT1; ANN_l_But2; ANN_l_BUT3; ANN_l_BUT4; ANN_l_BUT5; ANN_l_BUT6; ANN_l_BUT7; ANN_l_BUT8; ANN_l_BUT9; xSort)
	C_TEXT:C284($_t_oldMethodName; ANN_t_COL1; ANN_t_COL2; ANN_t_COL3; ANN_t_COL4; ANN_t_COL5; ANN_t_COL6; ANN_t_COL7; ANN_t_COL8; ANN_t_COL9; ANN_t_HED1)
	C_TEXT:C284(ANN_t_HED2; ANN_t_HED3; ANN_t_HED4; ANN_t_HED5; ANN_t_HED6; ANN_t_HED7; ANN_t_HED8; ANN_t_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Analyses_InLPB")
If ([ANALYSES:36]Record_Number_Start:10=0)
	REDUCE SELECTION:C351([IDENTIFIERS:16]; 0)
	xSort:=0
	READ ONLY:C145([IDENTIFIERS:16])
	OBJECT SET VISIBLE:C603(ANN_lb_LBFiles; False:C215)
Else 
	OBJECT SET VISIBLE:C603(ANN_lb_LBFiles; True:C214)
	READ WRITE:C146([IDENTIFIERS:16])
	xSort:=1
	QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]Table_Number:1>=[ANALYSES:36]Record_Number_Start:10; *)
	QUERY:C277([IDENTIFIERS:16];  & ; [IDENTIFIERS:16]Table_Number:1<=([ANALYSES:36]Record_Number_Start:10+49))
	ARRAY INTEGER:C220(ANN_aI_FileNo; 0)
	ARRAY TEXT:C222(ANN_at_FileName; 0)
	ARRAY LONGINT:C221(ANN_al_Number; 0)
	ARRAY INTEGER:C220(ANN_ai_LeadingZeros; 0)
	ARRAY BOOLEAN:C223(ANN_abo_MultiNos; 0)
	ARRAY BOOLEAN:C223(ANN_abo_Backslash; 0)
	SELECTION TO ARRAY:C260([IDENTIFIERS:16]Table_Number:1; ANN_aI_FileNo; [IDENTIFIERS:16]Name:3; ANN_at_FileName; [IDENTIFIERS:16]Number:2; ANN_al_Number; [IDENTIFIERS:16]Office_Code:4; ANN_abo_OfficeCode; [IDENTIFIERS:16]Backslash:5; ANN_abo_Backslash; [IDENTIFIERS:16]Leading_Zeros:6; ANN_ai_LeadingZeros; [IDENTIFIERS:16]Multiple_Numbers:7; ANN_abo_MultiNos)
	
	LB_SetupListbox(->ANN_lb_LBFiles; "ANN_t"; "ANN_L"; 1; ->ANN_aI_FileNo; ->ANN_at_FileName; ->ANN_al_Number; ->ANN_abo_OfficeCode; ->ANN_abo_Backslash; ->ANN_ai_LeadingZeros; ->ANN_abo_MultiNos)
	
	
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
	
End if 
Macro_AccType("Load "+String:C10(Table:C252(->[ANALYSES:36])))
ERR_MethodTrackerReturn("Analyses_InLPB"; $_t_oldMethodName)
