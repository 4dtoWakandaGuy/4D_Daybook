//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_SaveActionAttributes
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/02/2010 16:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_Data; 0)
	//ARRAY LONGINT(SD2_al_ActionREALFieldNum;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataLong;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataMANY;0;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldNum;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldType;0)
	//ARRAY REAL(SD2_ar_ActionVirtFieldDataREAL;0)
	ARRAY TEXT:C222($_at_Data; 0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldDataMA;0;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldDataTXT;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldName;0)
	C_BOOLEAN:C305(SD2_bo_FieldNamesLoaded)
	C_LONGINT:C283($_l_FieldIndex; $_l_offset; $_l_VirtualFIeldNumber; $_l_ColumnIndex; $_l_FieldIndex; $_l_offset; $_l_VirtualFIeldNumber)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_SaveActionAttributes")
//this method will load all the atributes of a diary action back into the blob
If (Not:C34(SD2_bo_FieldNamesLoaded))
	ARRAY LONGINT:C221(SD2_al_ActionVirtFieldNum; 0)
	ARRAY LONGINT:C221(SD2_al_ActionREALFieldNum; 0)
	ARRAY TEXT:C222(SD2_at_ActionVirtFieldName; 0)
	ARRAY LONGINT:C221(SD2_al_ActionVirtFieldType; 0)
	//`
	ARRAY LONGINT:C221(SD2_al_ActionVirtFieldNum; 99)
	ARRAY LONGINT:C221(SD2_al_ActionREALFieldNum; 99)
	ARRAY TEXT:C222(SD2_at_ActionVirtFieldName; 99)
	ARRAY LONGINT:C221(SD2_al_ActionVirtFieldType; 99)
	
	$_l_offset:=1
	SD2_al_ActionVirtFieldNum{$_l_offset}:=1
	SD2_al_ActionREALFieldNum{$_l_offset}:=1
	SD2_at_ActionVirtFieldName{$_l_offset}:="Action Code"
	SD2_al_ActionVirtFieldType{$_l_offset}:=21
	//
	$_l_offset:=$_l_offset+1
	SD2_al_ActionVirtFieldNum{$_l_offset}:=2
	SD2_al_ActionREALFieldNum{$_l_offset}:=2
	SD2_at_ActionVirtFieldName{$_l_offset}:="Action Name"
	SD2_al_ActionVirtFieldType{$_l_offset}:=21
	//
	$_l_offset:=$_l_offset+1
	SD2_al_ActionVirtFieldNum{$_l_offset}:=3
	SD2_al_ActionREALFieldNum{$_l_offset}:=3
	SD2_at_ActionVirtFieldName{$_l_offset}:="Export"
	SD2_al_ActionVirtFieldType{$_l_offset}:=21
	//
	$_l_offset:=$_l_offset+1
	SD2_al_ActionVirtFieldNum{$_l_offset}:=4
	SD2_al_ActionREALFieldNum{$_l_offset}:=4
	SD2_at_ActionVirtFieldName{$_l_offset}:="Document Code"
	SD2_al_ActionVirtFieldType{$_l_offset}:=21
	//
	$_l_offset:=$_l_offset+1
	SD2_al_ActionVirtFieldNum{$_l_offset}:=5
	SD2_al_ActionREALFieldNum{$_l_offset}:=5
	SD2_at_ActionVirtFieldName{$_l_offset}:="Priority"
	SD2_al_ActionVirtFieldType{$_l_offset}:=21
	//
	$_l_offset:=$_l_offset+1
	SD2_al_ActionVirtFieldNum{$_l_offset}:=6
	SD2_al_ActionREALFieldNum{$_l_offset}:=6
	SD2_at_ActionVirtFieldName{$_l_offset}:="Default Description"
	SD2_al_ActionVirtFieldType{$_l_offset}:=2
	
	$_l_offset:=$_l_offset+1
	SD2_al_ActionVirtFieldNum{$_l_offset}:=7
	SD2_al_ActionREALFieldNum{$_l_offset}:=7
	SD2_at_ActionVirtFieldName{$_l_offset}:="WP action"
	SD2_al_ActionVirtFieldType{$_l_offset}:=9
	
	$_l_offset:=$_l_offset+1
	SD2_al_ActionVirtFieldNum{$_l_offset}:=8
	SD2_al_ActionREALFieldNum{$_l_offset}:=9
	SD2_at_ActionVirtFieldName{$_l_offset}:="Exclude from Adder"
	SD2_al_ActionVirtFieldType{$_l_offset}:=9
	
	$_l_offset:=$_l_offset+1
	SD2_al_ActionVirtFieldNum{$_l_offset}:=9
	SD2_al_ActionREALFieldNum{$_l_offset}:=10
	SD2_at_ActionVirtFieldName{$_l_offset}:="Action Type ID"
	SD2_al_ActionVirtFieldType{$_l_offset}:=9
	
	$_l_offset:=$_l_offset+1
	SD2_al_ActionVirtFieldNum{$_l_offset}:=10
	SD2_al_ActionREALFieldNum{$_l_offset}:=12
	SD2_at_ActionVirtFieldName{$_l_offset}:="Action ID"
	SD2_al_ActionVirtFieldType{$_l_offset}:=9
	
	$_l_offset:=$_l_offset+1
	SD2_al_ActionVirtFieldNum{$_l_offset}:=11
	SD2_al_ActionREALFieldNum{$_l_offset}:=0
	SD2_at_ActionVirtFieldName{$_l_offset}:="Action Locations"
	SD2_al_ActionVirtFieldType{$_l_offset}:=116  // 2D Longint
	
	$_l_offset:=$_l_offset+1
	SD2_al_ActionVirtFieldNum{$_l_offset}:=12
	SD2_al_ActionREALFieldNum{$_l_offset}:=0
	SD2_at_ActionVirtFieldName{$_l_offset}:="Threaded"
	SD2_al_ActionVirtFieldType{$_l_offset}:=9
	
	$_l_offset:=$_l_offset+1
	SD2_al_ActionVirtFieldNum{$_l_offset}:=13
	SD2_al_ActionREALFieldNum{$_l_offset}:=0
	SD2_at_ActionVirtFieldName{$_l_offset}:="Threaded View Option"
	SD2_al_ActionVirtFieldType{$_l_offset}:=9
	//1=View Original Item 0=View Diary item
	
	$_l_offset:=$_l_offset+1
	SD2_al_ActionVirtFieldNum{$_l_offset}:=14
	SD2_al_ActionREALFieldNum{$_l_offset}:=0
	SD2_at_ActionVirtFieldName{$_l_offset}:="Action Class ID"  //Template action used
	SD2_al_ActionVirtFieldType{$_l_offset}:=9
	
	$_l_offset:=$_l_offset+1
	SD2_al_ActionVirtFieldNum{$_l_offset}:=15
	SD2_al_ActionREALFieldNum{$_l_offset}:=0
	SD2_at_ActionVirtFieldName{$_l_offset}:="Amount of Time"  //
	SD2_al_ActionVirtFieldType{$_l_offset}:=9
	
	$_l_offset:=$_l_offset+1
	SD2_al_ActionVirtFieldNum{$_l_offset}:=16
	SD2_al_ActionREALFieldNum{$_l_offset}:=0
	SD2_at_ActionVirtFieldName{$_l_offset}:="Amount of Time Type"  //
	SD2_al_ActionVirtFieldType{$_l_offset}:=9
	//0= minutes 1=hours 2=days
	
	$_l_offset:=$_l_offset+1
	SD2_al_ActionVirtFieldNum{$_l_offset}:=17
	SD2_al_ActionREALFieldNum{$_l_offset}:=0
	SD2_at_ActionVirtFieldName{$_l_offset}:="Start Time"
	SD2_al_ActionVirtFieldType{$_l_offset}:=9
	
	$_l_offset:=$_l_offset+1
	SD2_al_ActionVirtFieldNum{$_l_offset}:=18
	SD2_al_ActionREALFieldNum{$_l_offset}:=0
	SD2_at_ActionVirtFieldName{$_l_offset}:="End Time"  //
	SD2_al_ActionVirtFieldType{$_l_offset}:=9
	
	$_l_offset:=$_l_offset+1
	SD2_al_ActionVirtFieldNum{$_l_offset}:=19
	SD2_al_ActionREALFieldNum{$_l_offset}:=0
	SD2_at_ActionVirtFieldName{$_l_offset}:="Start Day"  //Number
	SD2_al_ActionVirtFieldType{$_l_offset}:=9
	
	$_l_offset:=$_l_offset+1
	SD2_al_ActionVirtFieldNum{$_l_offset}:=20
	SD2_al_ActionREALFieldNum{$_l_offset}:=0
	SD2_at_ActionVirtFieldName{$_l_offset}:="End Day"  //Number
	SD2_al_ActionVirtFieldType{$_l_offset}:=9
	
	$_l_offset:=$_l_offset+1
	SD2_al_ActionVirtFieldNum{$_l_offset}:=21
	SD2_al_ActionREALFieldNum{$_l_offset}:=0
	SD2_at_ActionVirtFieldName{$_l_offset}:="Reminder"  //Number
	SD2_al_ActionVirtFieldType{$_l_offset}:=9
	//0=no 1=yes
	
	$_l_offset:=$_l_offset+1
	SD2_al_ActionVirtFieldNum{$_l_offset}:=22
	SD2_al_ActionREALFieldNum{$_l_offset}:=0
	SD2_at_ActionVirtFieldName{$_l_offset}:="Reminder Time"  //Number
	SD2_al_ActionVirtFieldType{$_l_offset}:=9
	//Time before event
	
	$_l_offset:=$_l_offset+1
	SD2_al_ActionVirtFieldNum{$_l_offset}:=23
	SD2_al_ActionREALFieldNum{$_l_offset}:=0
	SD2_at_ActionVirtFieldName{$_l_offset}:="Reminder Time Type"  //Number
	SD2_al_ActionVirtFieldType{$_l_offset}:=9
	//0= minutes 1=hours 2=days
	
	$_l_offset:=$_l_offset+1
	SD2_al_ActionVirtFieldNum{$_l_offset}:=24
	SD2_al_ActionREALFieldNum{$_l_offset}:=0
	SD2_at_ActionVirtFieldName{$_l_offset}:="Exclude NON working Days"  //Number
	SD2_al_ActionVirtFieldType{$_l_offset}:=9
	//Item will not automatically go into a non-working day
	
	$_l_offset:=$_l_offset+1
	SD2_al_ActionVirtFieldNum{$_l_offset}:=25
	SD2_al_ActionREALFieldNum{$_l_offset}:=0
	SD2_at_ActionVirtFieldName{$_l_offset}:="Whose Diaries"  //Number
	SD2_al_ActionVirtFieldType{$_l_offset}:=116
	//IDs of personnel(or could be groups at some point) whose diary this should go in
	//See virtual field 8(real field 9) for exclude from adder
	
	$_l_offset:=$_l_offset+1
	SD2_al_ActionVirtFieldNum{$_l_offset}:=26
	SD2_al_ActionREALFieldNum{$_l_offset}:=0
	SD2_at_ActionVirtFieldName{$_l_offset}:="Restrict Table"  //Number
	SD2_al_ActionVirtFieldType{$_l_offset}:=116
	//tables this diary action is used with(only restricts usage in ADDING a record from tabs)
	
	$_l_offset:=$_l_offset+1
	SD2_al_ActionVirtFieldNum{$_l_offset}:=27
	SD2_al_ActionREALFieldNum{$_l_offset}:=0
	SD2_at_ActionVirtFieldName{$_l_offset}:="Macro Codes"  //
	SD2_al_ActionVirtFieldType{$_l_offset}:=121
	
	$_l_offset:=$_l_offset+1
	SD2_al_ActionVirtFieldNum{$_l_offset}:=28
	SD2_al_ActionREALFieldNum{$_l_offset}:=0
	SD2_at_ActionVirtFieldName{$_l_offset}:="Macro Names"  //
	SD2_al_ActionVirtFieldType{$_l_offset}:=121
	
	$_l_offset:=$_l_offset+1
	SD2_al_ActionVirtFieldNum{$_l_offset}:=29
	SD2_al_ActionREALFieldNum{$_l_offset}:=0
	SD2_at_ActionVirtFieldName{$_l_offset}:="Macro Event"  //Number
	SD2_al_ActionVirtFieldType{$_l_offset}:=116
	//1=on saving new
	//2=on saving existing
	//3=on opening
	//4=on Setting a result code
	//5=on setting to Done
	$_l_offset:=$_l_offset+1
	SD2_al_ActionVirtFieldNum{$_l_offset}:=42
	SD2_al_ActionREALFieldNum{$_l_offset}:=0
	SD2_at_ActionVirtFieldName{$_l_offset}:="Action Level Field Macros"  //
	SD2_al_ActionVirtFieldType{$_l_offset}:=9
	// these macros will be "modify"+action code+ Field num
	
	$_l_offset:=$_l_offset+1
	SD2_al_ActionVirtFieldNum{$_l_offset}:=43
	SD2_al_ActionREALFieldNum{$_l_offset}:=0
	SD2_at_ActionVirtFieldName{$_l_offset}:="Ignore Other Macros"  //Number
	SD2_al_ActionVirtFieldType{$_l_offset}:=116
	
	$_l_offset:=$_l_offset+1
	SD2_al_ActionVirtFieldNum{$_l_offset}:=30
	SD2_al_ActionREALFieldNum{$_l_offset}:=0
	SD2_at_ActionVirtFieldName{$_l_offset}:="Result Codes"  //
	SD2_al_ActionVirtFieldType{$_l_offset}:=121
	
	
	$_l_offset:=$_l_offset+1
	SD2_al_ActionVirtFieldNum{$_l_offset}:=31
	SD2_al_ActionREALFieldNum{$_l_offset}:=0
	SD2_at_ActionVirtFieldName{$_l_offset}:="Post Time processing Action"  //Number
	SD2_al_ActionVirtFieldType{$_l_offset}:=9
	//0=No action
	//1=Nag User
	//2=Put in to do list
	//3 Auto Complete
	//4 force user to complete
	
	$_l_offset:=$_l_offset+1
	SD2_al_ActionVirtFieldNum{$_l_offset}:=32
	SD2_al_ActionREALFieldNum{$_l_offset}:=0
	SD2_at_ActionVirtFieldName{$_l_offset}:="Auto Result Code"  //
	SD2_al_ActionVirtFieldType{$_l_offset}:=21
	//Only used if post time processing action is 3(Auto Complete)
	
	$_l_offset:=$_l_offset+1
	SD2_al_ActionVirtFieldNum{$_l_offset}:=33
	SD2_al_ActionREALFieldNum{$_l_offset}:=0
	SD2_at_ActionVirtFieldName{$_l_offset}:="Data Entry Form"  //
	SD2_al_ActionVirtFieldType{$_l_offset}:=21
	
	$_l_offset:=$_l_offset+1
	SD2_al_ActionVirtFieldNum{$_l_offset}:=34
	SD2_al_ActionREALFieldNum{$_l_offset}:=0
	SD2_at_ActionVirtFieldName{$_l_offset}:="Use WP for action Description"  //Number
	SD2_al_ActionVirtFieldType{$_l_offset}:=9
	
	$_l_offset:=$_l_offset+1
	SD2_al_ActionVirtFieldNum{$_l_offset}:=35
	SD2_al_ActionREALFieldNum{$_l_offset}:=0
	SD2_at_ActionVirtFieldName{$_l_offset}:="Static Record Fields"  //Number
	SD2_al_ActionVirtFieldType{$_l_offset}:=116
	
	
	$_l_offset:=$_l_offset+1
	SD2_al_ActionVirtFieldNum{$_l_offset}:=36
	SD2_al_ActionREALFieldNum{$_l_offset}:=0
	SD2_at_ActionVirtFieldName{$_l_offset}:="Static Record Codes"  //
	SD2_al_ActionVirtFieldType{$_l_offset}:=121
	
	$_l_offset:=$_l_offset+1
	SD2_al_ActionVirtFieldNum{$_l_offset}:=37
	SD2_al_ActionREALFieldNum{$_l_offset}:=0
	SD2_at_ActionVirtFieldName{$_l_offset}:="Time Units"  //
	SD2_al_ActionVirtFieldType{$_l_offset}:=1
	
	$_l_offset:=$_l_offset+1
	SD2_al_ActionVirtFieldNum{$_l_offset}:=38
	SD2_al_ActionREALFieldNum{$_l_offset}:=0
	SD2_at_ActionVirtFieldName{$_l_offset}:="Time Units Value"  //
	SD2_al_ActionVirtFieldType{$_l_offset}:=1
	
	$_l_offset:=$_l_offset+1
	SD2_al_ActionVirtFieldNum{$_l_offset}:=39
	SD2_al_ActionREALFieldNum{$_l_offset}:=0
	SD2_at_ActionVirtFieldName{$_l_offset}:="Time Units Macro Code"  //
	SD2_al_ActionVirtFieldType{$_l_offset}:=21
	
	$_l_offset:=$_l_offset+1
	SD2_al_ActionVirtFieldNum{$_l_offset}:=40
	SD2_al_ActionREALFieldNum{$_l_offset}:=0
	SD2_at_ActionVirtFieldName{$_l_offset}:="Agenda Colours Fill"  //
	SD2_al_ActionVirtFieldType{$_l_offset}:=116
	// 3 elements  element 1= red 2=green 3=blue(see diary fields)
	
	$_l_offset:=$_l_offset+1
	SD2_al_ActionVirtFieldNum{$_l_offset}:=41
	SD2_al_ActionREALFieldNum{$_l_offset}:=0
	SD2_at_ActionVirtFieldName{$_l_offset}:="Agenda Colours Accent"  //
	SD2_al_ActionVirtFieldType{$_l_offset}:=116
	// 3 elements  element 1= red 2=green 3=blue(see diary fields)
	
	
	
	// The name of the form to use to display the diary record
	SD2_bo_FieldNamesLoaded:=True:C214
	ARRAY LONGINT:C221(SD2_al_ActionVirtFieldNum; $_l_offset)
	ARRAY LONGINT:C221(SD2_al_ActionREALFieldNum; $_l_offset)
	ARRAY TEXT:C222(SD2_at_ActionVirtFieldName; $_l_offset)
	ARRAY LONGINT:C221(SD2_al_ActionVirtFieldType; $_l_offset)
	SORT ARRAY:C229(SD2_al_ActionVirtFieldNum; SD2_al_ActionREALFieldNum; SD2_at_ActionVirtFieldName; SD2_al_ActionVirtFieldType)
Else 
	$_l_offset:=Size of array:C274(SD2_al_ActionVirtFieldNum)
End if 
ARRAY LONGINT:C221(SD2_al_ActionVirtFieldDataLong; $_l_offset)
ARRAY TEXT:C222(SD2_at_ActionVirtFieldDataTXT; $_l_offset)
ARRAY TEXT:C222(SD2_at_ActionVirtFieldDataTXT; $_l_offset)
ARRAY REAL:C219(SD2_ar_ActionVirtFieldDataREAL; $_l_offset)
ARRAY LONGINT:C221(SD2_al_ActionVirtFieldDataMANY; $_l_offset; 0)
ARRAY TEXT:C222(SD2_at_ActionVirtFieldDataMA; $_l_offset; 0)
$_l_offset:=0
For ($_l_FieldIndex; 1; Size of array:C274(SD2_al_ActionVirtFieldNum))
	$_l_VirtualFIeldNumber:=SD2_al_ActionVirtFieldNum{$_l_FieldIndex}
	If (BLOB size:C605([ACTIONS:13]xActionAttributes:11)>$_l_offset)
		Case of 
			: (SD2_al_ActionVirtFieldType{$_l_VirtualFIeldNumber}=9)  // Longint one dimension
				BLOB TO VARIABLE:C533([ACTIONS:13]xActionAttributes:11; SD2_al_ActionVirtFieldDataLong{$_l_VirtualFIeldNumber}; $_l_offset)
				If (SD2_al_ActionVirtFieldDataLong{$_l_VirtualFIeldNumber}=0)
					If (SD2_al_ActionREALFieldNum{$_l_VirtualFIeldNumber}>0)
						//this is a field in the table anyway so get the data from there
						$_ptr_Field:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_VirtualFIeldNumber})
						Case of 
							: (Type:C295($_ptr_Field->)=Is boolean:K8:9)
								SD2_al_ActionVirtFieldDataLong{$_l_VirtualFIeldNumber}:=Num:C11($_ptr_Field->)
							: (Type:C295($_ptr_Field->)=Is longint:K8:6)
								SD2_al_ActionVirtFieldDataLong{$_l_VirtualFIeldNumber}:=($_ptr_Field->)
						End case 
					End if 
					
				End if 
				
			: (SD2_al_ActionVirtFieldType{$_l_VirtualFIeldNumber}=21)  // String one dimension
				BLOB TO VARIABLE:C533([ACTIONS:13]xActionAttributes:11; SD2_at_ActionVirtFieldDataTXT{$_l_VirtualFIeldNumber}; $_l_offset)
				If (SD2_at_ActionVirtFieldDataTXT{$_l_VirtualFIeldNumber}="")
					If (SD2_al_ActionREALFieldNum{$_l_VirtualFIeldNumber}>0)
						//this is a field in the table anyway so get the data from there
						$_ptr_Field:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_VirtualFIeldNumber})
						
						SD2_at_ActionVirtFieldDataTXT{$_l_VirtualFIeldNumber}:=$_ptr_Field->
						
					End if 
					
				End if 
				
			: (SD2_al_ActionVirtFieldType{$_l_VirtualFIeldNumber}=2)  // TEXT one dimension
				BLOB TO VARIABLE:C533([ACTIONS:13]xActionAttributes:11; SD2_at_ActionVirtFieldDataTXT{$_l_VirtualFIeldNumber}; $_l_offset)
				If (SD2_at_ActionVirtFieldDataTXT{$_l_VirtualFIeldNumber}="")
					If (SD2_al_ActionREALFieldNum{$_l_VirtualFIeldNumber}>0)
						//this is a field in the table anyway so get the data from there
						$_ptr_Field:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_VirtualFIeldNumber})
						
						SD2_at_ActionVirtFieldDataTXT{$_l_VirtualFIeldNumber}:=$_ptr_Field->
						
					End if 
					
				End if 
				
			: (SD2_al_ActionVirtFieldType{$_l_VirtualFIeldNumber}=1)  // Real one dimension
				BLOB TO VARIABLE:C533([ACTIONS:13]xActionAttributes:11; SD2_ar_ActionVirtFieldDataREAL{$_l_VirtualFIeldNumber}; $_l_offset)
				If (SD2_ar_ActionVirtFieldDataREAL{$_l_VirtualFIeldNumber}=0)
					If (SD2_al_ActionREALFieldNum{$_l_VirtualFIeldNumber}>0)
						//this is a field in the table anyway so get the data from there
						$_ptr_Field:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_VirtualFIeldNumber})
						
						SD2_ar_ActionVirtFieldDataREAL{$_l_VirtualFIeldNumber}:=$_ptr_Field->
						
					End if 
					
				End if 
				
				
			: (SD2_al_ActionVirtFieldType{$_l_VirtualFIeldNumber}=116)  // Longint TWO dimension
				//These are all virtual
				ARRAY LONGINT:C221($_al_Data; 0)
				BLOB TO VARIABLE:C533([ACTIONS:13]xActionAttributes:11; $_al_Data; $_l_offset)
				INSERT IN ARRAY:C227(SD2_al_ActionVirtFieldDataMANY{$_l_VirtualFIeldNumber}; Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_VirtualFIeldNumber})+1; Size of array:C274($_al_Data))
				
				For ($_l_ColumnIndex; 1; Size of array:C274($_al_Data))
					SD2_al_ActionVirtFieldDataMANY{$_l_VirtualFIeldNumber}{$_l_ColumnIndex}:=$_al_Data{$_l_VirtualFIeldNumber}
				End for 
				
			: (SD2_al_ActionVirtFieldType{$_l_VirtualFIeldNumber}=121)  // String TWO dimension
				//These are all virtual
				ARRAY TEXT:C222($_at_Data; 0)
				BLOB TO VARIABLE:C533([ACTIONS:13]xActionAttributes:11; $_at_Data; $_l_offset)
				INSERT IN ARRAY:C227(SD2_at_ActionVirtFieldDataMA{$_l_VirtualFIeldNumber}; Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_VirtualFIeldNumber})+1; Size of array:C274($_at_Data))
				
				For ($_l_ColumnIndex; 1; Size of array:C274($_al_Data))
					SD2_at_ActionVirtFieldDataMA{$_l_VirtualFIeldNumber}{$_l_ColumnIndex}:=$_at_Data{$_l_VirtualFIeldNumber}
				End for 
				
				
		End case 
	Else 
		If (SD2_al_ActionREALFieldNum{$_l_VirtualFIeldNumber}>0)
			$_ptr_Field:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_VirtualFIeldNumber})
			Case of 
				: (SD2_al_ActionVirtFieldType{$_l_VirtualFIeldNumber}=9)
					$_ptr_Field:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_VirtualFIeldNumber})
					Case of 
						: (Type:C295($_ptr_Field->)=Is boolean:K8:9)
							SD2_al_ActionVirtFieldDataLong{$_l_VirtualFIeldNumber}:=Num:C11($_ptr_Field->)
						: (Type:C295($_ptr_Field->)=Is longint:K8:6)
							SD2_al_ActionVirtFieldDataLong{$_l_VirtualFIeldNumber}:=($_ptr_Field->)
					End case 
					
				: (SD2_al_ActionVirtFieldType{$_l_VirtualFIeldNumber}=21)
					$_ptr_Field:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_VirtualFIeldNumber})
					SD2_at_ActionVirtFieldDataTXT{$_l_VirtualFIeldNumber}:=$_ptr_Field->
				: (SD2_al_ActionVirtFieldType{$_l_VirtualFIeldNumber}=2)
					$_ptr_Field:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_VirtualFIeldNumber})
					SD2_at_ActionVirtFieldDataTXT{$_l_VirtualFIeldNumber}:=$_ptr_Field->
				: (SD2_al_ActionVirtFieldType{$_l_VirtualFIeldNumber}=1)
					$_ptr_Field:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_VirtualFIeldNumber})
					SD2_ar_ActionVirtFieldDataREAL{$_l_VirtualFIeldNumber}:=$_ptr_Field->
					
			End case 
			
			
		End if 
		
	End if 
	
	
End for 
ERR_MethodTrackerReturn("SD2_SaveActionAttributes"; $_t_oldMethodName)
