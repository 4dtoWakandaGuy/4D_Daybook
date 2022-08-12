If (False:C215)
	//Project Form Method Name: EW_ExportProjectsManager
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/10/2012 14:33
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(EW_lb_ProjectList;0)
	//ARRAY LONGINT(EW_al_ProjectNumbers;0)
	//ARRAY TEXT(EW_at_ProjectsNames;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; EW_l_ExportProjectTable)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM EW_ExportProjectsManager"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		WS_AutoscreenSize(3; 369; 300)
		
		If (EW_l_ExportProjectTable>0)
			QUERY:C277([EW_ExportProjects:117]; [EW_ExportProjects:117]ProjectPrimeTableNumber:39=EW_l_ExportProjectTable)
		Else 
			ALL RECORDS:C47([EW_ExportProjects:117])
		End if 
		SELECTION TO ARRAY:C260([EW_ExportProjects:117]ProjectName:1; EW_at_ProjectsNames; [EW_ExportProjects:117]RecordNumber:2; EW_al_ProjectNumbers)
		SORT ARRAY:C229(EW_at_ProjectsNames; EW_al_ProjectNumbers)
		
		EW_LBI_Setup(->EW_lb_ProjectList; "EWPrefs"; 1; ->EW_at_ProjectsNames; ->EW_al_ProjectNumbers)
		LB_Setdividers(->EW_lb_ProjectList; Light grey:K11:13; 32)  //Both black
		LB_SetColours(->EW_lb_ProjectList; Black:K11:16; Grey:K11:15; Light grey:K11:13)
		
		
		
		
End case 
ERR_MethodTrackerReturn("FM EW_ExportProjectsManager"; $_t_oldMethodName)
