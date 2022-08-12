//%attributes = {}
If (False:C215)
	//Project Method Name:      STOCK_BuildUnique
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_AnalysisCode; $_t_Contruct; $_t_Currency; $_t_Layer; $_t_Location; $_t_oldMethodName; $_t_Stocktype; $0; $1; $2; $3)
	C_TEXT:C284($4; $5; $6)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STOCK_BuildUnique")

//when calling direct passed the -value of this
If (Count parameters:C259>=5)
	$_t_Currency:=" "*(6-Length:C16($2))+$2
	$_t_Layer:=" "*(6-Length:C16($3))+$3
	$_t_Stocktype:=" "*(6-Length:C16($4))+$4
	$_t_AnalysisCode:=" "*(6-Length:C16($5))+$5
	$_t_Contruct:=$_t_Currency+$_t_Layer+$_t_Stocktype+$_t_AnalysisCode
	If (Count parameters:C259>=6)
		$_t_Location:=" "*(6-Length:C16($6))+$6
		$_t_Contruct:=$_t_Contruct+$_t_Location
	End if 
	$0:=$1+$_t_Contruct
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("STOCK_BuildUnique"; $_t_oldMethodName)