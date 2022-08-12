//%attributes = {}

If (False:C215)
	//Database Method Name:      SD2_ActionFields
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  04/10/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD2_al_ActionREALFieldNum;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldNum;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldType;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldName;0)
	C_BOOLEAN:C305($_bo_FieldNamesLoaded; SD2_bo_FieldNamesLoaded)
	C_LONGINT:C283($_l_offset; $0)
	C_POINTER:C301($_ptr_VirtualFieldName; $_Ptr_VirtualFieldNum; $_Ptr_VirtualFieldType; $_ptr_VirtualRealFieldNumber; $1; $2; $3; $4)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("SD2_ActionFields")
If (Count parameters:C259>=4)
	$_Ptr_VirtualFieldNum:=$1
	$_ptr_VirtualRealFieldNumber:=$2
	$_ptr_VirtualFieldName:=$3
	$_Ptr_VirtualFieldType:=$4
Else 
	If (Not:C34(SD2_bo_FieldNamesLoaded))
		ARRAY LONGINT:C221(SD2_al_ActionVirtFieldNum; 0)
		ARRAY LONGINT:C221(SD2_al_ActionREALFieldNum; 0)
		ARRAY TEXT:C222(SD2_at_ActionVirtFieldName; 0)
		ARRAY LONGINT:C221(SD2_al_ActionVirtFieldType; 0)
	End if 
	$_Ptr_VirtualFieldNum:=->SD2_al_ActionVirtFieldNum
	$_ptr_VirtualRealFieldNumber:=->SD2_al_ActionREALFieldNum
	$_ptr_VirtualFieldName:=->SD2_at_ActionVirtFieldName
	$_Ptr_VirtualFieldType:=->SD2_al_ActionVirtFieldType
End if 

If (Not:C34($_bo_FieldNamesLoaded))
	ARRAY LONGINT:C221($_Ptr_VirtualFieldNum->; 0)
	ARRAY LONGINT:C221($_ptr_VirtualRealFieldNumber->; 0)
	ARRAY TEXT:C222($_ptr_VirtualFieldName->; 0)
	ARRAY LONGINT:C221($_Ptr_VirtualFieldType->; 0)
	//`
	
	$_l_offset:=1
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 1)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 1)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Action Code")  //²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 21)
	//
	$_l_offset:=$_l_offset+1
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 2)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 2)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Action Name")  //²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 21)
	
	//
	$_l_offset:=$_l_offset+1
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 3)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 3)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Export")  //
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 21)
	
	//
	$_l_offset:=$_l_offset+1
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 4)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 4)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Document Code")  //²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 21)
	
	//
	$_l_offset:=$_l_offset+1
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 5)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 5)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Priority")  //²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 21)
	
	//
	$_l_offset:=$_l_offset+1
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 6)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 6)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Default Description")  //²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 2)
	
	$_l_offset:=$_l_offset+1
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 7)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 7)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "WP action")  //²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 9)
	
	
	$_l_offset:=$_l_offset+1
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 8)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 9)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Exclude from Adder")  //²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 9)
	
	$_l_offset:=$_l_offset+1
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 9)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 10)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Action Type ID")  //²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 9)
	
	
	$_l_offset:=$_l_offset+1
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 10)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 12)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Action  ID")  //²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 9)
	
	
	$_l_offset:=$_l_offset+1
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 11)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 0)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Action Locations")  //²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 116)
	
	
	$_l_offset:=$_l_offset+1
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 12)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 0)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Threaded")  //²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 9)
	
	$_l_offset:=$_l_offset+1
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 13)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 0)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Threaded View Option")  //²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 9)
	
	//1=View Original Item 0=View Diary item
	
	$_l_offset:=$_l_offset+1
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 14)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 0)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Action Class ID")  //²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 9)
	
	$_l_offset:=$_l_offset+1
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 15)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 0)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Amount of Time")  //²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 9)
	
	$_l_offset:=$_l_offset+1
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 16)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 0)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Amount of Time Type")  //²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 9)
	//0= minutes 1=hours 2=days
	
	$_l_offset:=$_l_offset+1
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 17)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 0)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Start Time")  ///²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 9)
	
	
	$_l_offset:=$_l_offset+1
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 18)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 0)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "End Time")  //²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 9)
	
	
	$_l_offset:=$_l_offset+1
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 19)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 0)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Start Day")  //²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 9)
	
	
	$_l_offset:=$_l_offset+1
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 20)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 0)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "End Day")  //²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 9)
	
	
	$_l_offset:=$_l_offset+1
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 21)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 0)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Reminder")  //²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 9)
	
	//0=no 1=yes
	
	$_l_offset:=$_l_offset+1
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 22)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 0)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Reminder Time")  //²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 9)
	
	//Time before event
	
	$_l_offset:=$_l_offset+1
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 23)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 0)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Reminder Time Type")  //²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 9)
	
	//0= minutes 1=hours 2=days
	
	$_l_offset:=$_l_offset+1
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 24)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 0)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Exclude NON working Days")  //²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 9)
	
	//Item will not automatically go into a non-working day
	
	$_l_offset:=$_l_offset+1
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 25)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 0)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Whose Diaries")  //²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 116)
	
	//IDs of personnel(or could be groups at some point) whose diary this should go in
	//See virtual field 8(real field 9) for exclude from adder
	
	$_l_offset:=$_l_offset+1
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 26)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 0)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Restrict Table")  //²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 116)
	
	//tables this diary action is used with(only restricts usage in ADDING a record from tabs)
	
	$_l_offset:=$_l_offset+1
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 27)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 0)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Macro Codes")  //²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 121)
	
	
	$_l_offset:=$_l_offset+1
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 28)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 0)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Macro Names")  //²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 121)
	
	
	$_l_offset:=$_l_offset+1
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 29)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 0)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Macro Event")  //²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 116)
	
	//1=on saving new
	//2=on saving existing
	//3=on opening
	//4=on Setting a result code
	//5=on setting to Done
	$_l_offset:=$_l_offset+1
	$_l_offset:=$_l_offset+1
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 30)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 0)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Result Codes")  ///²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 121)
	
	
	
	$_l_offset:=$_l_offset+1
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 31)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 0)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Post Time processing Action")  ///²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 9)
	//0=No action
	//1=Nag User
	//2=Put in to do list
	//3 Auto Complete
	//4 force user to complete
	
	$_l_offset:=$_l_offset+1
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 32)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 0)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Auto Result Code")  ///²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 21)
	
	//Only used if post time processing action is 3(Auto Complete)
	
	$_l_offset:=$_l_offset+1
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 33)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 0)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Data Entry Form")  ///²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 21)
	
	
	$_l_offset:=$_l_offset+1
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 34)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 0)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Use WP for action Description")  ///²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 9)
	
	
	$_l_offset:=$_l_offset+1
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 35)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 0)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Static Record Fields")  ///²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 116)
	
	
	
	$_l_offset:=$_l_offset+1
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 36)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 0)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Static Record Codes")  ///²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 121)
	
	
	$_l_offset:=$_l_offset+1
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 37)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 0)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Time Units")  ///²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 1)
	
	
	$_l_offset:=$_l_offset+1
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 38)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 0)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Time Units Value")  ///²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 1)
	
	
	$_l_offset:=$_l_offset+1
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 39)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 0)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Time Units Macro Code")  ///²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 1)
	
	$_l_offset:=$_l_offset+1
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 40)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 0)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Agenda Colours Fill")  ///²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 116)
	
	// 3 elements  element 1= red 2=green 3=blue(see diary fields)
	
	$_l_offset:=$_l_offset+1
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 41)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 0)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Agenda Colours Accent")  //
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 116)
	
	// 3 elements  element 1= red 2=green 3=blue(see diary fields)
	$_l_offset:=$_l_offset+1
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 42)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 0)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Action Level Field Macros")  ///²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 9)
	
	// these macros will be "modify"+action code+ Field num
	
	$_l_offset:=$_l_offset+1
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 43)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 0)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Ignore Other Macros")  ///²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 116)
	
	
	// The name of the form to use to display the diary record
	$_l_offset:=$_l_offset+1
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 44)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 0)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Done Action")  //²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 9)
	
	//``
	$_l_offset:=$_l_offset+1
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 45)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 0)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Relation Type")  //²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 116)
	
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 46)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 0)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Relation Table")  //²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 116)
	
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 47)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 0)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Relation Restriction")  //²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 116)
	
	$_l_offset:=$_l_offset+1
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 48)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 0)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Get Rate From Job Stage")  //²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 9)
	
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 49)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 0)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Record Time_In Job Stage")  //²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 9)
	
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 50)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 0)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Job Stage Type")  //²
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 21)  //This will use a pop-up of job stage types(all!)
	
	//<>SYS_ti_DefaultTimeUnits  is the number of billing units per hour to 60 would mean we charge per minute.
	
	//?? the number of units a diary action uses are normally calculated from the amount of diary time
	//normally using the universal <>SYS_ti_DefaultTimeUnits set in preferences-here we are allowing a differenct unit to be used.
	
	//when we use 'Get Rate From Job Stage'   we calculate the rate(and amount) using job stage rules.
	// see JobPers_InLP
	
	//you will see that looks for special rates from the company-so that needs mod so it can use the diary Company_Not the job company
	//and there was planned an enhancement in the personnel to code them out at different rates for different job stages AND to have the job personel be contacts as well
	//at the moment a person has a single time billing catagory code. this would involve them having Multiple category codes
	//and rules fro when each code applies. This might link to a Job stage Code(Job stage Type) and/Or a time day number
	//they might have a monday-friday 9-5 cost and a sales rate and a say-sun-bank hols rate 9-5 and an out of hours (Other times) rate and other times sun-bank hols rate
	
	//in this case here though the job person is the person closing the diary record(they did the job-or rather the person assigned does
	//here we would be calculating the number of
	//note that those rates are per Default UNit(Which is not clear on the personell entry screen(It really should be per hour).
	//if it was per hour that would be better then we can easily calc the cost per any unit.
	//see the new table PERSONNEL_BILLING_CATS which needs to appear on PERSONNEL(and Groups-with inheritance)
	//and then needs to be used.
	
	
	
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 51)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 0)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Workflow Table")
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 116)
	
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 52)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 0)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Workflow Macro")
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 121)
	
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 53)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 0)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Action Status")
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 116)
	
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 54)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 0)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Action Status Colour")
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 116)
	
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 55)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 0)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Action Status Timing")
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 116)
	
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldNum->; 56)
	APPEND TO ARRAY:C911($_ptr_VirtualRealFieldNumber->; 0)
	APPEND TO ARRAY:C911($_ptr_VirtualFieldName->; "Action Status Timing Type")
	APPEND TO ARRAY:C911($_Ptr_VirtualFieldType->; 116)
	
	$_l_offset:=Size of array:C274($_Ptr_VirtualFieldType->)
	If (Count parameters:C259<4)
		SD2_bo_FieldNamesLoaded:=True:C214
	End if 
	SORT ARRAY:C229($_Ptr_VirtualFieldNum->; $_ptr_VirtualRealFieldNumber->; $_ptr_VirtualFieldName->; $_Ptr_VirtualFieldType->)
Else 
	$_l_offset:=Size of array:C274($_Ptr_VirtualFieldNum->)
End if 
$0:=$_l_offset
ERR_MethodTrackerReturn("SD2_ActionFields"; $_t_oldMethodName)
