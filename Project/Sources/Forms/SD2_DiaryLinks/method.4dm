If (False:C215)
	//Project Form Method Name: SD2_DiaryLinks
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/09/2013 09:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD_lb_Relations;0)
	//ARRAY LONGINT(SD2_al_DisplayDiaryField;0)
	//ARRAY LONGINT(SD2_al_DisplayRecordID;0)
	//ARRAY LONGINT(SD2_al_DisplayRelationTable;0)
	//ARRAY LONGINT(SD2_al_RelatedRecordTableNum;0)
	//ARRAY LONGINT(SD2_al_relationDiaryField;0)
	//ARRAY LONGINT(SD2_al_RelationTable;0)
	//ARRAY LONGINT(SD2_al_RelationType;0)
	//ARRAY TEXT(SD2_at_RelationTypes;0)
	//ARRAY TEXT(SD2_at_DisplayrecordCode;0)
	//ARRAY TEXT(SD2_at_DisplayRelations;0)
	//ARRAY TEXT(SD2_at_RelationName;0)
	//ARRAY TEXT(SD2_at_RelationNames;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_CurrentWinWidth; $_l_Difference; $_l_event; $_l_Index; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; $_l_WinNewWidth; SD2a_l_BUT1; SD2a_l_But2)
	C_LONGINT:C283(SD2a_l_BUT3; SD2a_l_BUT4; SD2a_l_BUT5; SD2a_l_BUT6; SD2a_l_BUT7; SD2a_l_BUT8; SD2a_l_BUT9)
	C_TEXT:C284($_t_oldMethodName; SD2a_t_COL1; SD2a_t_COL2; SD2a_t_COL3; SD2a_t_COL4; SD2a_t_COL5; SD2a_t_COL6; SD2a_t_COL7; SD2a_t_COL8; SD2a_t_COL9; SD2a_t_HED1)
	C_TEXT:C284(SD2a_t_HED2; SD2a_t_HED3; SD2a_t_HED4; SD2a_t_HED5; SD2a_t_HED6; SD2a_t_HED7; SD2a_t_HED8; SD2a_t_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM SD2_DiaryLinks"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		
		
		ARRAY LONGINT:C221(SD2_al_RelationType; 2)
		ARRAY TEXT:C222(SD2_at_RelationTypes; 2)
		SD2_al_RelationType{1}:=1
		SD2_al_RelationType{2}:=2
		SD2_at_RelationTypes{1}:="Allow"
		SD2_at_RelationTypes{2}:="Force"
		
		//This array is for the pop up-SD2_at_RelationNames it is set in SD2_loadDiary it has the syncrod arrays SD2_al_RelationTable and SD2_al_relationDiaryField which contains the diary field if there is one
		//current relations are in the following arrays
		//SD2_al_RelatedRecordTableNum
		//SD2_al_RelatedRecordID
		//SD2_at_RelatedRecordCode
		//SD2_at_RelatedRecordName
		//SD2_at_RelatedRecordType(from relations name in SD2_at_RelationNames)
		//SD2_al_RelatedtoDiaryfield
		
		//the maximum number of relations to any given table is controlled in the diary action(by default there is no limit). With the fields that are on the diary only the first relation is linked to that field
		//These are loaded when the action is loaded(cant resttict if no action..maybe should not be able have multiple relations until there is an action) these are loaded into the arrays
		//SD2_al_RelationTypesS;)
		//SD2_at_RelationTypesS;)
		//The above should contain allow or force.
		//SD2_al_RelationTablesS;) `Table num restriction applies to
		//SD2_at_RelationTablesS;) `Table name restriction applies to
		//SD2_al_RelationRestS;)
		//SD2_at_RelationRest;) `this is the displayed value by default it is 'unlimited' else its a string of the qty
		//TRACE
		//so on this screen we will show one row per existing relation sorted by the relation name. if there is a realtion to for instance companies an additional blank line is added for companies to add a new one if more relations are available)
		
		If (Size of array:C274(SD2_al_RelatedRecordTableNum)>0)
			//THERE are existing relations
			
		Else 
			ARRAY TEXT:C222(SD2_at_DisplayRelations; 0)  //The relation name(based on SD2_at_RelatedRecordType
			
			ARRAY LONGINT:C221(SD2_al_DisplayRelationTable; 0)
			ARRAY LONGINT:C221(SD2_al_DisplayDiaryField; 0)
			ARRAY LONGINT:C221(SD2_al_DisplayRecordID; 0)
			ARRAY TEXT:C222(SD2_at_DisplayrecordCode; 0)
			ARRAY TEXT:C222(SD2_at_RelationName; 0)
			If (Not:C34([DIARY:12]Done:14)) & ([DIARY:12]Result_Code:11="")  //dont add the rows if the diary is completed
				
				For ($_l_Index; 1; Size of array:C274(SD2_at_RelationNames))
					APPEND TO ARRAY:C911(SD2_at_DisplayRelations; SD2_at_RelationNames{$_l_Index})
					APPEND TO ARRAY:C911(SD2_al_DisplayRelationTable; SD2_al_RelationTable{$_l_Index})
					APPEND TO ARRAY:C911(SD2_al_DisplayDiaryField; SD2_al_relationDiaryField{$_l_Index})
					APPEND TO ARRAY:C911(SD2_at_RelationName; "")
					
					APPEND TO ARRAY:C911(SD2_al_DisplayRecordID; 0)
					APPEND TO ARRAY:C911(SD2_at_DisplayrecordCode; "")
					
				End for 
			End if 
		End if 
		
		LB_SetupListbox(->SD_lb_Relations; "SD2a_t"; "SD2a_L"; 1; ->SD2_at_DisplayRelations; ->SD2_at_DisplayrecordCode; ->SD2_at_RelationName; ->SD2_al_DisplayRecordID; ->SD2_al_DisplayDiaryField; ->SD2_al_DisplayRelationTable)
		
		LB_SetColumnHeaders(->SD_lb_Relations; "SD2a_L"; 1; "Relation"; "Record"; "Relation Name"; "RecordID"; "DiaryField"; "RelatedTable")
		LB_SetColumnWidths(->SD_lb_Relations; "SD2a_t"; 1; 100; 100; 100; 0; 0; 0)
		LB_SetEnterable(->SD_lb_Relations; False:C215; 0)
		If (Not:C34([DIARY:12]Done:14)) & ([DIARY:12]Result_Code:11="")  //if the diary is completed dont let adds happen
			
			LB_SetEnterable(->SD_lb_Relations; True:C214; 2)
		End if 
		
		LB_SetScroll(->SD_lb_Relations; -3; -2)
		LB_StyleSettings(->SD_lb_Relations; "Black"; 9; "SD2a_t"; ->[DIARY:12])
		LB_Setdividers(->SD_lb_Relations; 0; 0)  //Both off
		
		LBI_Scrollonresize(->SD_lb_Relations)
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
		$_l_WinNewWidth:=320
		$_l_CurrentWinWidth:=$_l_WindowRight-$_l_WindowLeft
		$_l_Difference:=$_l_WinNewWidth-$_l_CurrentWinWidth
		SET WINDOW RECT:C444($_l_WindowLeft-$_l_Difference; $_l_windowTop; $_l_WindowLeft+$_l_WinNewWidth; $_l_WindowBottom)
		
		
		
		
		
End case 
ERR_MethodTrackerReturn("FM SD2_DiaryLinks"; $_t_oldMethodName)
