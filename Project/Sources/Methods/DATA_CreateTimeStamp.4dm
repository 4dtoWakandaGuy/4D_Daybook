//%attributes = {}

If (False:C215)
	//Project Method Name:      DATA_CreateTimeStamp
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
	C_DATE:C307($_dte_CurrentDate; $_dte_OffsetTimeStampFrom; $1)
	C_LONGINT:C283($_l_TimeStamp; $0)
	C_TIME:C306($_ti_CurrentTime; $2)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("DATA_CreateTimeStamp")
If (False:C215)
	//-------------------- Method Set Up -------------------
	//Project Method Name:      DATA_CreateTimeStamp
	//Parameter Detail:
	//------------------ Method Narrative ------------------
	//This is generic routine. It creates a time stamp(a longint offset by the date and time
	
	//------------------ Methods/Table List ----------------
	
	//Table(If any): 
	
	//Module: 
	
	//Calling Menu/Method/Form/Object Method: 
	//
	//Related Methods: 
	
	//
	//------------------ Assumptions ----------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/09/2015
	//Created BY: Nigel Greenlee
	
	//////21/03/2017
	//Modified By: Nigel Greenlee
	
End if 
//---------- Type Parameters & Local Variables ----------
If (True:C214)
End if 
//---------- Reassign Passed Parameters OR get values ----------

If (Count parameters:C259>=1)
	$_dte_CurrentDate:=$1
	If ($_dte_CurrentDate=!00-00-00!)
		$_dte_CurrentDate:=Current date:C33(*)
	End if 
	
	If (Count parameters:C259>=2)
		$_ti_CurrentTime:=$2
	Else 
		$_ti_CurrentTime:=Current time:C178(*)
	End if 
	
Else 
	
	//UNIT_TESTINGINIT (Current method name)
	
	If (<>UNIT_bo_UnitTesting)
		
	End if 
	
End if 


//-------------------- Main Method -------------------

If ($_dte_CurrentDate#!00-00-00!) & ($_ti_CurrentTime#?00:00:00?)
	$_dte_OffsetTimeStampFrom:=!2000-01-01!
	If ($_dte_CurrentDate>=$_dte_OffsetTimeStampFrom)
		$_l_TimeStamp:=(($_dte_CurrentDate-$_dte_OffsetTimeStampFrom)*86400)+($_ti_CurrentTime*1)
		
	Else 
		$_l_TimeStamp:=(($_dte_CurrentDate-$_dte_OffsetTimeStampFrom)*86400)-($_ti_CurrentTime*1)
		
	End if 
	$0:=$_l_TimeStamp
End if 
ERR_MethodTrackerReturn("DATA_CreateTimeStamp"; $_t_oldMethodName)