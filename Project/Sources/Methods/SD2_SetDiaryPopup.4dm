//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_SetDiaryPopup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/03/2010 20:47
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(PAL_at_Function27;0)
	//ARRAY TEXT(PAL_at_Function28;0)
	//ARRAY TEXT(PAL_at_PopUpMenu27;0)
	//ARRAY TEXT(PAL_at_PopUpMenu28;0)
	C_LONGINT:C283(<>BUTTPROC; $_l_Element; $_l_Element2; $_l_EnterRow; $_l_Index)
	C_POINTER:C301($1; $2; $3)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_SetDiaryPopup")

//This method will update an arrray in the process ◊ButtProc
//this is the pallette down the left hand side
//I am modifying the diary enter  and the plug button so the add is contectual
//the to arrays to set are PAL_at_PopUpMenu27 (enter) and PAL_at_PopUpMenu28 (view)
//What we do is gather from the current tab
ARRAY TEXT:C222(PAL_at_PopUpMenu27; 0)
ARRAY TEXT:C222(PAL_at_PopUpMenu28; 0)
ARRAY TEXT:C222(PAL_at_Function27; 0)
ARRAY TEXT:C222(PAL_at_Function28; 0)
If (Count parameters:C259>=2)
	If (Size of array:C274($1->)>0)
		Case of 
			: ($1->{$2->}=Table:C252(->[DIARY:12])) | (True:C214)
				If (Count parameters:C259>2)
					If (Size of array:C274($3->)=0)  //there are no diary tabs on this form
						ARRAY TEXT:C222(PAL_at_PopUpMenu27; 99)
						ARRAY TEXT:C222(PAL_at_PopUpMenu28; 99)
						ARRAY TEXT:C222(PAL_at_Function27; 99)
						ARRAY TEXT:C222(PAL_at_Function28; 99)
						PAL_at_PopUpMenu27{1}:=Get localized string:C991("EntertoSchedule")
						PAL_at_Function27{1}:="Enter Diary"
						PAL_at_PopUpMenu28{1}:=Get localized string:C991("ViewSchedule")
						PAL_at_Function28{1}:="View Diary"
						$_l_Element:=1
						$_l_Element2:=1
						If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))>1)  // Service Contract
							If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))#3)
								$_l_Element:=$_l_Element+1
								PAL_at_PopUpMenu27{$_l_Element}:=Get localized string:C991("EnterServiceCall")
								PAL_at_Function27{$_l_Element}:="Enter Service Call"
							End if 
							$_l_Element2:=$_l_Element2+1
							PAL_at_PopUpMenu28{$_l_Element2}:=Get localized string:C991("ViewServiceCalls")
							PAL_at_Function28{$_l_Element2}:="View Service Calls"
						End if 
						ARRAY TEXT:C222(PAL_at_PopUpMenu27; $_l_Element)
						ARRAY TEXT:C222(PAL_at_PopUpMenu28; $_l_Element2)
						ARRAY TEXT:C222(PAL_at_Function27; $_l_Element)
						ARRAY TEXT:C222(PAL_at_Function28; $_l_Element2)
						
					Else 
						ARRAY TEXT:C222(PAL_at_PopUpMenu27; 99)
						ARRAY TEXT:C222(PAL_at_PopUpMenu28; 99)
						ARRAY TEXT:C222(PAL_at_Function27; 99)
						ARRAY TEXT:C222(PAL_at_Function28; 99)
						PAL_at_PopUpMenu27{1}:=Get localized string:C991("EntertoSchedule")
						PAL_at_Function27{1}:="Enter Diary"
						PAL_at_PopUpMenu28{1}:=Get localized string:C991("ViewSchedule")
						PAL_at_Function28{1}:="View Diary"
						$_l_Element:=1
						
						For ($_l_Index; 1; Size of array:C274($3->))
							$_l_EnterRow:=Find in array:C230(PAL_at_PopUpMenu27; Get localized string:C991("Enter")+" "+$3->{$_l_Index})
							If ($_l_EnterRow<0)
								$_l_Element:=$_l_Element+1
								PAL_at_PopUpMenu27{$_l_Element}:=Get localized string:C991("Enter")+" "+$3->{$_l_Index}
								PAL_at_Function27{$_l_Element}:="Enter Related Diary"
								PAL_at_PopUpMenu28{$_l_Element}:=Get localized string:C991("View")+" "+$3->{$_l_Index}
								PAL_at_Function28{$_l_Element}:="View Related Diary"
								
							End if 
						End for 
						$_l_Element2:=$_l_Element
						If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))>1)  // Service Contract
							If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))#3)
								$_l_Element:=$_l_Element+1
								PAL_at_PopUpMenu27{$_l_Element}:=Get localized string:C991("EnterServiceCall")
								PAL_at_Function27{$_l_Element}:="Enter Service Call"
							End if 
							$_l_Element2:=$_l_Element2+1
							PAL_at_PopUpMenu28{$_l_Element2}:=Get localized string:C991("ViewServiceCalls")
							PAL_at_Function28{$_l_Element2}:="View Service Calls"
						End if 
						ARRAY TEXT:C222(PAL_at_PopUpMenu27; $_l_Element)
						ARRAY TEXT:C222(PAL_at_PopUpMenu28; $_l_Element2)
						ARRAY TEXT:C222(PAL_at_Function27; $_l_Element)
						ARRAY TEXT:C222(PAL_at_Function28; $_l_Element2)
					End if 
				Else 
					ARRAY TEXT:C222(PAL_at_PopUpMenu27; 99)
					ARRAY TEXT:C222(PAL_at_PopUpMenu28; 99)
					ARRAY TEXT:C222(PAL_at_Function27; 99)
					ARRAY TEXT:C222(PAL_at_Function28; 99)
					PAL_at_PopUpMenu27{1}:=Get localized string:C991("EntertoSchedule")
					PAL_at_Function27{1}:="Enter Diary"
					PAL_at_PopUpMenu28{1}:=Get localized string:C991("ViewSchedule")
					PAL_at_Function28{1}:="View Diary"
					$_l_Element:=1
					$_l_Element2:=1
					If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))>1)  // Service Contract
						If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))#3)
							$_l_Element:=$_l_Element+1
							PAL_at_PopUpMenu27{$_l_Element}:=Get localized string:C991("EnterServiceCall")
							PAL_at_Function27{$_l_Element}:="Enter Service Call"
						End if 
						$_l_Element2:=$_l_Element2+1
						PAL_at_PopUpMenu28{$_l_Element2}:=Get localized string:C991("ViewServiceCalls")
						PAL_at_Function28{$_l_Element2}:="View Service Calls"
					End if 
					ARRAY TEXT:C222(PAL_at_PopUpMenu27; $_l_Element)
					ARRAY TEXT:C222(PAL_at_PopUpMenu28; $_l_Element2)
					ARRAY TEXT:C222(PAL_at_Function27; $_l_Element)
					ARRAY TEXT:C222(PAL_at_Function28; $_l_Element2)
				End if 
			Else 
				ARRAY TEXT:C222(PAL_at_PopUpMenu27; 99)
				ARRAY TEXT:C222(PAL_at_PopUpMenu28; 99)
				ARRAY TEXT:C222(PAL_at_Function27; 99)
				ARRAY TEXT:C222(PAL_at_Function28; 99)
				PAL_at_PopUpMenu27{1}:=Get localized string:C991("EntertoSchedule")
				PAL_at_Function27{1}:="Enter Diary"
				PAL_at_PopUpMenu28{1}:=Get localized string:C991("ViewSchedule")
				PAL_at_Function28{1}:="View Diary"
				$_l_Element:=1
				$_l_Element2:=1
				If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))>1)  // Service Contract
					If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))#3)
						$_l_Element:=$_l_Element+1
						PAL_at_PopUpMenu27{$_l_Element}:=Get localized string:C991("EnterServiceCall")
						PAL_at_Function27{$_l_Element}:="Enter Service Call"
					End if 
					$_l_Element2:=$_l_Element2+1
					PAL_at_PopUpMenu28{$_l_Element2}:=Get localized string:C991("ViewServiceCalls")
					PAL_at_Function28{$_l_Element2}:="View Service Calls"
				End if 
				ARRAY TEXT:C222(PAL_at_PopUpMenu27; $_l_Element)
				ARRAY TEXT:C222(PAL_at_PopUpMenu28; $_l_Element2)
				ARRAY TEXT:C222(PAL_at_Function27; $_l_Element)
				ARRAY TEXT:C222(PAL_at_Function28; $_l_Element2)
		End case 
		
	Else 
		ARRAY TEXT:C222(PAL_at_PopUpMenu27; 99)
		ARRAY TEXT:C222(PAL_at_PopUpMenu28; 99)
		ARRAY TEXT:C222(PAL_at_Function27; 99)
		ARRAY TEXT:C222(PAL_at_Function28; 99)
		PAL_at_PopUpMenu27{1}:=Get localized string:C991("EntertoSchedule")
		PAL_at_Function27{1}:="Enter Diary"
		PAL_at_PopUpMenu28{1}:=Get localized string:C991("ViewSchedule")
		PAL_at_Function28{1}:="View Diary"
		$_l_Element:=1
		$_l_Element2:=1
		If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))>1)  // Service Contract
			If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))#3)
				$_l_Element:=$_l_Element+1
				PAL_at_PopUpMenu27{$_l_Element}:=Get localized string:C991("EnterServiceCall")
				PAL_at_Function27{$_l_Element}:="Enter Service Call"
			End if 
			$_l_Element2:=$_l_Element2+1
			PAL_at_PopUpMenu28{$_l_Element2}:=Get localized string:C991("ViewServiceCalls")
			PAL_at_Function28{$_l_Element2}:="View Service Calls"
		End if 
		ARRAY TEXT:C222(PAL_at_PopUpMenu27; $_l_Element)
		ARRAY TEXT:C222(PAL_at_PopUpMenu28; $_l_Element2)
		ARRAY TEXT:C222(PAL_at_Function27; $_l_Element)
		ARRAY TEXT:C222(PAL_at_Function28; $_l_Element2)
		
	End if 
Else 
	ARRAY TEXT:C222(PAL_at_PopUpMenu27; 99)
	ARRAY TEXT:C222(PAL_at_PopUpMenu28; 99)
	ARRAY TEXT:C222(PAL_at_Function27; 99)
	ARRAY TEXT:C222(PAL_at_Function28; 99)
	PAL_at_PopUpMenu27{1}:=Get localized string:C991("EntertoSchedule")
	PAL_at_Function27{1}:="Enter Diary"
	PAL_at_PopUpMenu28{1}:=Get localized string:C991("ViewSchedule")
	PAL_at_Function28{1}:="View Diary"
	$_l_Element:=1
	$_l_Element2:=1
	If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))>1)  // Service Contract
		If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))#3)
			$_l_Element:=$_l_Element+1
			PAL_at_PopUpMenu27{$_l_Element}:=Get localized string:C991("EnterServiceCall")
			PAL_at_Function27{$_l_Element}:="Enter Service Call"
		End if 
		$_l_Element2:=$_l_Element2+1
		PAL_at_PopUpMenu28{$_l_Element2}:=Get localized string:C991("ViewServiceCalls")
		PAL_at_Function28{$_l_Element2}:="View Service Calls"
	End if 
	ARRAY TEXT:C222(PAL_at_PopUpMenu27; $_l_Element)
	ARRAY TEXT:C222(PAL_at_PopUpMenu28; $_l_Element2)
	ARRAY TEXT:C222(PAL_at_Function27; $_l_Element)
	ARRAY TEXT:C222(PAL_at_Function28; $_l_Element2)
End if 
ERR_MethodTrackerReturn("SD2_SetDiaryPopup"; $_t_oldMethodName)
