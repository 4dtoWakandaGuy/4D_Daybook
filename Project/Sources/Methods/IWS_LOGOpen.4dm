//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_LOGOpen
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/12/2009 10:51`Method: IWS_LOGOpen
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(<>LogDoc)
	//C_UNKNOWN($0)
	C_BOOLEAN:C305($0; $_bo_Result)
	C_TEXT:C284($_t_LogType; $_t_oldMethodName; $_t_Stamp; $1; Folder separator:K24:12; $_t_ApplicationPath; $_t_LogType; $_t_oldMethodName; $_t_Stamp; $1)
	C_TIME:C306(<>LogDoc; <>ConvLogDoc)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_LOGOpen")
//Method: IWS_LOGOpen
//

$_bo_Result:=False:C215

If (Count parameters:C259>0)
	
	$_t_LogType:=$1
	
	//Folder separator:=DB_DirSymbol 
	
	If (Is Windows:C1573)
		
		If (Application type:C494=4D Remote mode:K5:5)
			$_t_ApplicationPath:=UTI_GetFolderName(Application file:C491)+Folder separator:K24:12+"Logs"
		Else 
			$_t_ApplicationPath:=UTI_GetFolderName(Data file:C490)+Folder separator:K24:12+"Logs"
		End if 
		
		//$_t_ApplicationPath:=(FindFolder(GetStructPath))+Folder separator+"Logs"
		If (Test path name:C476($_t_ApplicationPath)#Is a folder:K24:2)
			CREATE FOLDER:C475($_t_ApplicationPath)
		End if 
		$_t_Stamp:=String:C10(Year of:C25(Current date:C33))+"_"+String:C10(Month of:C24(Current date:C33); "00")+String:C10(Day of:C23(Current date:C33); "00")+"_"+Replace string:C233(String:C10(Current time:C178); ":"; "_")
		
	Else 
		
		$_t_ApplicationPath:=""
		///Folder separator:=""
		$_t_Stamp:=String:C10(Year of:C25(Current date:C33))+String:C10(Month of:C24(Current date:C33); "00")+String:C10(Day of:C23(Current date:C33); "00")+"_"+Replace string:C233(String:C10(Current time:C178); ":"; "_")
		
	End if 
	
	Case of 
			
		: ($_t_LogType="GEN")
			$_t_ApplicationPath:=$_t_ApplicationPath+Folder separator:K24:12+"GEN_Log_"+$_t_Stamp
			<>LogDoc:=DB_CreateDocument($_t_ApplicationPath)
			$_bo_Result:=True:C214
			
		: ($_t_LogType="CON")
			$_t_ApplicationPath:=$_t_ApplicationPath+Folder separator:K24:12+"CONV_Log_"+$_t_Stamp
			<>ConvLogDoc:=DB_CreateDocument($_t_ApplicationPath)
			$_bo_Result:=True:C214
			
		: ($_t_LogType="ERR")
			$_t_ApplicationPath:=$_t_ApplicationPath+Folder separator:K24:12+"ERR_Log_"+$_t_Stamp
			//◊SYS_ti_ErrLog:=Create document($_t_ApplicationPath)
			$_bo_Result:=True:C214
			
		: ($_t_LogType="HIT")
			$_t_ApplicationPath:=$_t_ApplicationPath+Folder separator:K24:12+"HIT_Log_"+$_t_Stamp
			//◊IWS_ti_HitLog:=Create document($_t_ApplicationPath)
			$_bo_Result:=True:C214
			
		: ($_t_LogType="JSE")  //Ron 11/3/99 (JavaScript Error)
			$_t_ApplicationPath:=$_t_ApplicationPath+Folder separator:K24:12+"JSE_Log_"+$_t_Stamp
			//◊IWS_ti_HitLog:=Create document($_t_ApplicationPath)
			$_bo_Result:=True:C214
			
		: ($_t_LogType="LSU")  // Axel LogicServer Updater 10/18/2000
			$_t_ApplicationPath:=$_t_ApplicationPath+Folder separator:K24:12+"LSU_Log_"+$_t_Stamp
			//◊LSU_ti_LSULog:=Create document($_t_ApplicationPath)
			$_bo_Result:=True:C214
			
	End case 
	
End if   //(Count parameters>0)

$0:=$_bo_Result
ERR_MethodTrackerReturn("IWS_LOGOpen"; $_t_oldMethodName)
