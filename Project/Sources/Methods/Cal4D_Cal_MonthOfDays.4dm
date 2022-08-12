//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_MonthOfDays
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/12/2009 16:08`Method: Cal4D_Cal_MonthOfDays
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_Date; $_d_DateofFirst; $_d_DateStart; $_d_TestDate; $1)
	C_LONGINT:C283($_l_DateNum; $_l_Day; $_l_Index; $_l_Month; $_l_MonthID; $_l_SIzeofArray; $_l_Year)
	C_POINTER:C301($_ptr_Dates; $_ptr_Day; $_ptr_OrdDates; $2; $3; $4)
	C_TEXT:C284($_t_FirstDay; $_t_MethodName; $_t_oldMethodName; $5)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_MonthOfDays")


$_d_Date:=$1
$_ptr_OrdDates:=$2
$_ptr_Day:=$3
$_ptr_Dates:=$4
$_t_FirstDay:=$5


$_l_Year:=Year of:C25($_d_Date)
$_l_Month:=Month of:C24($_d_Date)
$_l_Day:=Day of:C23($_d_Date)
$_d_TestDate:=$_d_Date
If ($_d_Date#!00-00-00!)
	Repeat 
		$_d_TestDate:=$_d_TestDate-1
	Until (Month of:C24($_d_TestDate)#$_l_Month)
Else 
	$_d_TestDate:=$_d_Date
End if 


$_d_DateofFirst:=$_d_TestDate+1  //Date(String($_l_Month)+"/1/"+String($_l_Year))


$_l_DateNum:=Day number:C114($_d_DateofFirst)
Case of 
	: (($_t_FirstDay="Sun") | ($_t_FirstDay="") | ($_t_FirstDay="US"))
		If ($_l_DateNum=Sunday:K10:19)
			
			$_d_Date:=$_d_DateofFirst
		Else 
			$_d_Date:=$_d_DateofFirst-($_l_DateNum-1)
		End if 
		
	: (($_t_FirstDay="Mon") | ($_t_FirstDay="ISO") | ($_t_FirstDay="EUR"))
		If ($_l_DateNum=Monday:K10:13)
			
			$_d_Date:=$_d_DateofFirst
		Else 
			If ($_l_DateNum=Sunday:K10:19)
				
				$_d_Date:=$_d_DateofFirst-6
			Else 
				$_d_Date:=$_d_DateofFirst-($_l_DateNum-2)
			End if 
		End if 
		
	: ($_t_FirstDay="Sat")
		If ($_l_DateNum=Saturday:K10:18)
			
			$_d_Date:=$_d_DateofFirst
		Else 
			$_d_Date:=$_d_DateofFirst-$_l_DateNum
			If (($_d_Date#$_d_DateofFirst) & (Month of:C24($_d_Date)=Month of:C24($_d_DateofFirst)))
				$_d_Date:=Add to date:C393($_d_Date; 0; 0; -7)
			End if 
		End if 
		
End case 

////  Fill a calendar month with days
////
$_l_SIzeofArray:=Size of array:C274($_ptr_OrdDates->)
For ($_l_Index; 1; $_l_SIzeofArray)
	$_ptr_OrdDates->{$_l_Index}:=Cal4D_Cal_DateToOrdinal($_d_Date)
	$_ptr_Day->{$_l_Index}:=Day of:C23($_d_Date)
	$_ptr_Dates->{$_l_Index}:=$_d_Date
	$_d_Date:=Add to date:C393($_d_Date; 0; 0; 1)
End for 
ERR_MethodTrackerReturn("Cal4D_Cal_MonthOfDays"; $_t_oldMethodName)