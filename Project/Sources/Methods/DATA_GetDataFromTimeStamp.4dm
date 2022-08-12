//%attributes = {}

If (False:C215)
	//Project Method Name:      DATA_GetDataFromTimeStamp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  10/12/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>UNIT_bo_UnitTesting)
	C_DATE:C307($_dte_Date; $_dte_OffsetTimeStampFrom)
	C_LONGINT:C283($_l_TimeStamp; $_l_Type; $1)
	C_POINTER:C301($_Ptr_FirstVariable; $_Ptr_secondVariable; $2; $3)
	C_TIME:C306($_ti_Time)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("DATA_GetDataFromTimeStamp")
If (False:C215)
	//-------------------- Method Set Up -------------------
	//Project Method Name:      DATA_GetDataFromTimeStamp
	//Parameter Detail:
	//------------------ Method Narrative ------------------
	
	//------------------ Methods/Table List ----------------
	
	//Table(If any): 
	
	//Module: 
	
	//Calling Menu/Method/Form/Object Method: 
	//
	//Related Methods: 
	
	//
	//------------------ Assumptions ----------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/11/2015
	//Created BY: Nigel Greenlee
	
	//////21/03/2017
	//Modified By: Nigel Greenlee
	
End if 
//---------- Type Parameters & Local Variables ----------
If (True:C214)
End if 
//---------- Reassign Passed Parameters OR get values ----------
If (Count parameters:C259>=1)
	$_l_TimeStamp:=$1
	$_Ptr_FirstVariable:=$2
	If (Count parameters:C259>=2)
		$_Ptr_secondVariable:=$3
	End if 
	
	
Else 
	
	//UNIT_TESTINGINIT (Current method name)
	
	If (<>UNIT_bo_UnitTesting)
		
	End if 
	
End if 

//-------------------- Main Method -------------------

$_dte_OffsetTimeStampFrom:=!2000-01-01!
If (Not:C34(Is nil pointer:C315($_Ptr_FirstVariable)))
	If ($_l_TimeStamp>0)
		$_dte_Date:=$_dte_OffsetTimeStampFrom+($_l_TimeStamp\86400)
	Else 
		$_dte_Date:=$_dte_OffsetTimeStampFrom+($_l_TimeStamp\86400)+1
	End if 
	$_ti_Time:=Time:C179(Time string:C180(($_l_TimeStamp%86400)))
	$_l_Type:=Type:C295($_Ptr_FirstVariable->)
	Case of 
		: ($_l_Type=Is date:K8:7)
			$_Ptr_FirstVariable->:=$_dte_Date
		: ($_l_Type=Is time:K8:8)
			$_Ptr_FirstVariable->:=$_ti_Time
	End case 
	$_l_Type:=Type:C295($_Ptr_secondVariable->)
	Case of 
		: ($_l_Type=Is date:K8:7)
			$_Ptr_secondVariable->:=$_dte_Date
		: ($_l_Type=Is time:K8:8)
			$_Ptr_secondVariable->:=$_ti_Time
	End case 
End if 
ERR_MethodTrackerReturn("DATA_GetDataFromTimeStamp"; $_t_oldMethodName)