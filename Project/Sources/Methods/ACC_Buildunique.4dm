//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_Buildunique
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_AccountCode; $_t_AnalysisCode; $_t_CurrencyCode; $_t_LayerCode; $_t_oldMethodName; $_t_PeriodCode; $_t_Return; $0; $1; $2; $3)
	C_TEXT:C284($4; $5)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_Buildunique")


$_t_AccountCode:=" "*(10-Length:C16($1))+$1
$_t_AnalysisCode:=" "*(10-Length:C16($2))+$2
$_t_PeriodCode:=" "*(10-Length:C16($3))+$3
$_t_LayerCode:=" "*(6-Length:C16($4))+$4
$_t_CurrencyCode:=" "*(6-Length:C16($5))+$5
$_t_Return:=$_t_AccountCode+$_t_PeriodCode+$_t_AnalysisCode+$_t_LayerCode+$_t_CurrencyCode
$_t_Return:=Replace string:C233($_t_Return; Char:C90(64); "_")
$0:=$_t_Return

//we get a problem with queries if there is a char "@" in the text(ascii 64)
ERR_MethodTrackerReturn("ACC_Buildunique"; $_t_oldMethodName)
