//%attributes = {}

If (False:C215)
	//Project Method Name:      SD3_ObjectStringtoDate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  03/01/2020
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_OutputDate; $0)
	C_TEXT:C284($_t_Date; $_t_DateString; $_t_Month; $_t_oldMethodName; $_t_Year; $1)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("SD3_ObjectStringtoDate")
$0:=!00-00-00!

If (Count parameters:C259>=1)
	$_t_DateString:=$1
	///YYYY-MM-DDTHH:mm:ss.SSSZ
	If (Length:C16($_t_DateString)>4)
		$_t_Year:=Substring:C12($_t_DateString; 1; 4)
		$_t_Month:=Substring:C12($_t_DateString; 6; 2)
		$_t_Date:=Substring:C12($_t_DateString; 9; 2)
		$_d_OutputDate:=Date:C102($_t_Date+"/"+$_t_Month+"/"+$_t_Year)
		$0:=$_d_OutputDate
		
	End if 
End if 
ERR_MethodTrackerReturn("SD3_ObjectStringtoDate"; $_t_oldMethodName)
