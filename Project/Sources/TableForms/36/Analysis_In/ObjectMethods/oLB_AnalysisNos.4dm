If (False:C215)
	//object Name: [ANALYSES]Analysis_In.oLB_AnalysisNos
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
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
	C_LONGINT:C283($_l_ColumnNumber; $_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ANALYSES].Analysis_In.oLB_AnalysisNos"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Header Click:K2:40)
	: ($_l_event=On Clicked:K2:4) | ($_l_event=On Double Clicked:K2:5)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		$_l_ColumnNumber:=LB_GetColumn(->ANN_lb_LBFiles; $_t_VariableName)
		
		LB_GoToCell(->ANN_lb_LBFiles; $_l_ColumnNumber; $_l_Row)
	: ($_l_event=On Data Change:K2:15)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		$_l_ColumnNumber:=LB_GetColumn(->ANN_lb_LBFiles; $_t_VariableName)
		READ WRITE:C146([IDENTIFIERS:16])
		Case of 
			: ($_l_ColumnNumber=3)  //Number
				QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]Table_Number:1=ANN_ai_TableNumbers{$_l_Row})
				[IDENTIFIERS:16]Number:2:=ANN_al_Numbers{$_l_Row}
				SAVE RECORD:C53([IDENTIFIERS:16])
				UNLOAD RECORD:C212([IDENTIFIERS:16])
				
				
			: ($_l_ColumnNumber=4)  //Office code
				QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]Table_Number:1=ANN_ai_TableNumbers{$_l_Row})
				[IDENTIFIERS:16]Office_Code:4:=ANN_abo_officeCode{$_l_Row}
				SAVE RECORD:C53([IDENTIFIERS:16])
				UNLOAD RECORD:C212([IDENTIFIERS:16])
				
			: ($_l_ColumnNumber=5)  //backslash
				QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]Table_Number:1=ANN_ai_TableNumbers{$_l_Row})
				[IDENTIFIERS:16]Backslash:5:=ANN_abo_Backslash{$_l_Row}
				SAVE RECORD:C53([IDENTIFIERS:16])
				UNLOAD RECORD:C212([IDENTIFIERS:16])
				
			: ($_l_ColumnNumber=6)  //Leading zeros
				QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]Table_Number:1=ANN_ai_TableNumbers{$_l_Row})
				[IDENTIFIERS:16]Leading_Zeros:6:=ANN_al_LeadingZeros{$_l_Row}
				SAVE RECORD:C53([IDENTIFIERS:16])
				UNLOAD RECORD:C212([IDENTIFIERS:16])
				
			: ($_l_ColumnNumber=6)  //Multi Number
				QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]Table_Number:1=ANN_ai_TableNumbers{$_l_Row})
				[IDENTIFIERS:16]Multiple_Numbers:7:=ANN_abo_MultiNos{$_l_Row}
				SAVE RECORD:C53([IDENTIFIERS:16])
				UNLOAD RECORD:C212([IDENTIFIERS:16])
				
		End case 
		READ ONLY:C145([IDENTIFIERS:16])
		
End case 
ERR_MethodTrackerReturn("OBJ [ANALYSES].Analysis_In.oLB_AnalysisNos"; $_t_oldMethodName)
