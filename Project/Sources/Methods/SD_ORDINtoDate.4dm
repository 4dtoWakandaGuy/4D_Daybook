//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_ORDINtoDate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 17:04`Method: SD_ORDINtoDate
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_BaseDate; $0)
	C_LONGINT:C283($_l_Day; $_l_Month; $_l_NumberofDays; $_l_Year; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_ORDINtoDate")

$_l_Year:=$1\1000
$_l_Day:=$1%1000
$_l_NumberofDays:=$_l_Day-Num:C11(SD_YearisLeapYear(Date:C102("1/1/"+String:C10($_l_Year))))


Case of 
	: ($_l_NumberofDays>334)
		$_l_Month:=12
		$_l_Day:=$_l_NumberofDays-334
		
	: ($_l_NumberofDays>304)
		$_l_Month:=11
		$_l_Day:=$_l_NumberofDays-304
		
	: ($_l_NumberofDays>273)
		$_l_Month:=10
		$_l_Day:=$_l_NumberofDays-273
		
	: ($_l_NumberofDays>243)
		$_l_Month:=9
		$_l_Day:=$_l_NumberofDays-243
		
	: ($_l_NumberofDays>212)
		$_l_Month:=8
		$_l_Day:=$_l_NumberofDays-212
		
	: ($_l_NumberofDays>181)
		$_l_Month:=7
		$_l_Day:=$_l_NumberofDays-181
		
	: ($_l_NumberofDays>151)
		$_l_Month:=6
		$_l_Day:=$_l_NumberofDays-151
		
	: ($_l_NumberofDays>120)
		$_l_Month:=5
		$_l_Day:=$_l_NumberofDays-120
		
	: ($_l_NumberofDays>90)
		$_l_Month:=4
		$_l_Day:=$_l_NumberofDays-90
		
	: ($_l_NumberofDays>59)
		$_l_Month:=3
		$_l_Day:=$_l_NumberofDays-59
		
	: ($_l_NumberofDays>31)
		$_l_Month:=2
		$_l_Day:=$_l_NumberofDays-31
		
	: ($_l_NumberofDays>0)
		$_l_Month:=1
		$_l_Day:=$_l_NumberofDays
		
End case 

//========================    Clean up and Exit    =================================
//TRACE

//NG this may be correct for us Dates..but not for others
If ($_l_Year>0)
	$_d_BaseDate:=Date:C102("01/01/"+String:C10($_l_Year))
	Repeat 
		If (Month of:C24($_d_BaseDate)<$_l_Month)
			$_d_BaseDate:=$_d_BaseDate+27
		End if 
	Until (Month of:C24($_d_BaseDate)=$_l_Month)
	//Now we have the right month
	Case of 
		: (Day of:C23($_d_BaseDate)>$_l_Day)
			Repeat 
				$_d_BaseDate:=$_d_BaseDate-1
			Until (Day of:C23($_d_BaseDate)=$_l_Day)
			
		: (Day of:C23($_d_BaseDate)<$_l_Day)
			Repeat 
				$_d_BaseDate:=$_d_BaseDate+1
			Until (Day of:C23($_d_BaseDate)=$_l_Day)
		Else 
			//The date just happens to be correct
	End case 
Else 
	$_d_BaseDate:=!00-00-00!
	
End if 
$0:=$_d_BaseDate

//$0:=Date(String($_l_Month)+"/"+String($_l_Day)+"/"+String($_l_Year))
ERR_MethodTrackerReturn("SD_ORDINtoDate"; $_t_oldMethodName)
