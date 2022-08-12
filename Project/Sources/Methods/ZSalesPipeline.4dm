//%attributes = {}
If (False:C215)
	//Project Method Name:      ZSalesPipeline
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 17:32
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>HoldPipelineDIsplay)
	C_DATE:C307($6; $7; SP_D_FilterFromDate; SP_D_FilterToDate)
	C_LONGINT:C283(<>SalesPipelineProcess; $_l_AccesLevel; $_l_ProcessState; $_l_ProcessTime; $2; $3; $4; $8; $9; $_l_CurrentWinRefOLD; WIN_l_CurrentWinRef)
	C_LONGINT:C283(WIN_l_CurrentWinRefOLD)
	C_REAL:C285(SP_CompanyID; SP_PersonID; SP_personnelID; SP_Table; SP_workgroupID)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; $_t_processName; $1; $5; SP_RecordCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ZSalesPipeline")
//updated
If (Count parameters:C259=0)
	//this is called from a menu bar
	If (<>SalesPipelineProcess>0)
		PROCESS PROPERTIES:C336(<>SalesPipelineProcess; $_t_processName; $_l_ProcessState; $_l_ProcessTime)
		If ($_t_processName#"Sales Pipeline manager") | ($_l_ProcessState<0)
			<>SalesPipelineProcess:=0
			<>SalesPipelineProcess:=New process:C317("zSalesPipeline"; 64000; "Sales Pipeline Manager"; <>PER_t_CurrentUserInitials)
		Else 
			
			SHOW PROCESS:C325(<>SalesPipelineProcess)
			BRING TO FRONT:C326(<>SalesPipelineProcess)
			POST OUTSIDE CALL:C329(<>SalesPipelineProcess)
			
		End if 
	Else 
		<>SalesPipelineProcess:=New process:C317("zSalesPipeline"; 64000; "Sales Pipeline Manager"; <>PER_t_CurrentUserInitials)
	End if 
Else 
	//must be the process itself
	Start_Process
	If (<>HoldPipelineDIsplay)
		HIDE PROCESS:C324(Current process:C322)
	End if 
	If (Count parameters:C259>=9)
		SP_CompanyID:=$2
		SP_PersonID:=$3
		SP_Table:=$4
		SP_RecordCode:=$5
		SP_D_FilterFromDate:=$6
		SP_D_FilterToDate:=$7
		SP_personnelID:=$8
		SP_workgroupID:=$9
	End if 
	
	
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; 4)
	$_l_AccesLevel:=9999
	Case of 
		: ($_l_AccesLevel>3)
			
		: ($_l_AccesLevel=3)
			//access all users whose access level is =0,1,2,3
			
		: ($_l_AccesLevel=2)
			//workgroup owner
			//access people in the workgroup whose access level =0 or 1 or 2
		: ($_l_AccesLevel=1)
			//access people in same work group     whose access level is 0 or 1
	End case 
	
	READ WRITE:C146([PERSONNEL:11])
	QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$1)
	FORM SET INPUT:C55([SALES_PROJECTION:113]; "Pseudo_blank")
	
	FORM SET INPUT:C55([PERSONNEL:11]; "Pipeline_Manager")
	MODIFY RECORD:C57([PERSONNEL:11]; *)
	UNLOAD RECORD:C212([PERSONNEL:11])
	READ ONLY:C145([PERSONNEL:11])
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
End if 
ERR_MethodTrackerReturn("ZSalesPipeline"; $_t_oldMethodName)