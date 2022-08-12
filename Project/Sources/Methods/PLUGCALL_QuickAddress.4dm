//%attributes = {}
If (False:C215)
	//Project Method Name:      PLUGCALL_QuickAddress
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2010 13:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($2)
	C_POINTER:C301($3)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PLUGCALL_QuickAddress")
//in order to facilitate the conversion to 2003 this call has replaced
//the direct call to all quick address functions
// this can then be modified to suit whatever we are using
Case of 
	: ($1="init")
		If (Count parameters:C259>=2)
			//QAInitialise($2
			
		Else 
			//QAInitialise($2)
		End if 
	: ($1="err")
		If (Count parameters:C259>=3)
			If (Is Windows:C1573)
				
				//QAErrorMessage($2;$3->;79)
			Else 
				//$3->:=QA_ErrorString($2)
				
			End if 
			
		End if 
	: ($1="err2")
		//$3->:=QA_ErrorString($2)
	: ($1="RapidSearch")
		//$3->:=QARapid_Search($4»)
	: ($1="LookUpStrings")
		//$3->:=QA_LookupStrs($4»;$2;$5»;$6»;$7»;$8»;$9»)
	: ($1="RapidCount")
		//$3»:=QARapid_Count
	: ($1="RapidEnd")
		//QARapid_EndSeah
	: ($1="RapidClose")
		//QA_RapidClose
	: ($1="CLose")
		//QA_CLose
	: ($1="RapidAddrLine")
		//$3»:=QARapid_AddrLie($2;$5»;$4»;$6»)
	: ($1="RapidAddrOpen")
		//$3»:=QARapid_Open("";"")
	: ($1="Open")
		//$3»:=QA_Open
	: ($1="FIX")
		If (Count parameters:C259<4)
			//$3»:=QA_Fix(0;0;0)
		Else 
			//$3»:=QA_Fix($4»;$5»;$6»)
		End if 
	: ($1="TestPath")
		//$3->:=QA_DataPath($4->)
	: ($1="Lines")
		//$3»:=QA_Lines(5;41;41;31;21;13)
	: ($1="SpecialOps")
		//$3»:=QA_SpecialOpts($4»;$5»;$6»;$7»)
		
		
		
End case 
ERR_MethodTrackerReturn("PLUGCALL_QuickAddress"; $_t_oldMethodName)
