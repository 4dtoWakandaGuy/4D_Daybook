//%attributes = {}
If (False:C215)
	//Project Method Name:      SPCallShowPipeline
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 20:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>HoldPipelineDIsplay)
	C_DATE:C307($_d_DateFrom; $_d_DateTo; $5; $6)
	C_LONGINT:C283(<>SalesPipelineProcess; $_l_CompanyID; $_l_PersonelID; $_l_PersonID; $_l_ProcessState; $_l_ProcessTime; $_l_TableNumber; $_l_WorkGroupID; $1; $2; $3)
	C_LONGINT:C283($7; $8)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; $_t_processName; $_t_RecordCode; $4)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SPCallShowPipeline")
//this method will show the existing pipeline for a given context
//(it sets the filters)
If (Count parameters:C259>=1)
	$_l_CompanyID:=$1
	If (Count parameters:C259>=2)
		$_l_PersonID:=$2
		If (Count parameters:C259>=4)
			$_l_TableNumber:=$3
			$_t_RecordCode:=$4
			If (Count parameters:C259>=5)
				$_d_DateFrom:=$5
				If (Count parameters:C259>=6)
					$_d_DateTo:=$6
					If (Count parameters:C259>=7)
						$_l_PersonelID:=$7
						If (Count parameters:C259>=8)
							$_l_WorkGroupID:=$8
						End if 
					End if 
				End if 
			End if 
		End if 
	End if 
	
	<>HoldPipelineDIsplay:=True:C214  //setting this will make the
	//pipeline stay hidden to the display is updated
	If (<>SalesPipelineProcess>0)
		PROCESS PROPERTIES:C336(<>SalesPipelineProcess; $_t_processName; $_l_ProcessState; $_l_ProcessTime)
		If ($_t_processName#"Sales Pipeline manager") | ($_l_ProcessState<0)
			<>SalesPipelineProcess:=0
			<>SalesPipelineProcess:=New process:C317("zSalesPipeline"; 64000; "Sales Pipeline Manager"; <>PER_t_CurrentUserInitials; $_l_CompanyID; $_l_PersonID; $_l_TableNumber; $_t_RecordCode; $_d_DateFrom; $_d_DateTo; $_l_PersonelID; $_l_WorkGroupID)
		Else 
			//  SET PROCESS VARIABLE(◊SalesPipelineProcess;x;$_l_CompanyID)
			// SET PROCESS VARIABLE(◊SalesPipelineProcess;x;$_l_PersonID)
			// SET PROCESS VARIABLE(◊SalesPipelineProcess;x;$_l_TableNumber)
			// SET PROCESS VARIABLE(◊SalesPipelineProcess;x;$_t_RecordCode)
			// SET PROCESS VARIABLE(◊SalesPipelineProcess;x;$_d_DateFrom)
			// SET PROCESS VARIABLE(◊SalesPipelineProcess;x;$_d_DateTo)
			// SET PROCESS VARIABLE(◊SalesPipelineProcess;x;$_l_PersonelID)
			// SET PROCESS VARIABLE(◊SalesPipelineProcess;x;$_l_WorkGroupID)
			POST OUTSIDE CALL:C329(<>SalesPipelineProcess)
		End if 
	Else 
		<>SalesPipelineProcess:=New process:C317("zSalesPipeline"; 64000; "Sales Pipeline Manager"; <>PER_t_CurrentUserInitials; $_l_CompanyID; $_l_PersonID; $_l_TableNumber; $_t_RecordCode; $_d_DateFrom; $_d_DateTo; $_l_PersonelID; $_l_WorkGroupID)
	End if 
End if 
ERR_MethodTrackerReturn("SPCallShowPipeline"; $_t_oldMethodName)
