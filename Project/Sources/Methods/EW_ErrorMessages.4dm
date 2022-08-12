//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_ErrorMessages
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_Message; $_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_ErrorMessages")
// EW_ErrorMessages
// Converts cryptic error msgs into meaningful text
// 21/10/02 pb

$_t_Message:=$1
Case of 
	: ($_t_Message="")  // no error, in other words ...
		$0:=""
		
	: ($_t_Message="[Err=BAD_PWD]")
		$0:="The password is incorrect."
		EW_ErrorHandling(True:C214)
		
	: ($_t_Message="[Err=CNX_BRK")
		$0:="The network connection was interrupted."
		EW_ErrorHandling(True:C214)
		
	: ($_t_Message="[Err=CNX_DWN")
		$0:="There is no network connection."
		EW_ErrorHandling(True:C214)
		
	: ($_t_Message="[Err=C01_MIS]")
		$0:="The C01 code was not specified."
		EW_ErrorHandling(False:C215)
		
	: ($_t_Message="[Err=EMP_DAT]")
		$0:="No data received."
		EW_ErrorHandling(False:C215)
		
	: ($_t_Message="[Err=GEN_ERR]")
		$0:="General error."
		EW_ErrorHandling(False:C215)
		
	: ($_t_Message="[Err=SRV_MIS]")
		$0:="The IP address of the 4DBK server was not specified."
		EW_ErrorHandling(True:C214)
		
	: ($_t_Message="[Err=STO_MIS]")
		$0:="The store code was not specified."
		EW_ErrorHandling(False:C215)
		
	: ($_t_Message="[Err=STO_UNK]")
		$0:="The store does not exist on the specified 4DBK server."
		EW_ErrorHandling(True:C214)
		
	: ($_t_Message="[Err=FLD_UNK]")
		$0:="The specified field does not exist."
		EW_ErrorHandling(False:C215)
		
	: ($_t_Message="[Err=LAY_UNK]")
		$0:="The specified store does not have a data model."
		EW_ErrorHandling(True:C214)
		
	: ($_t_Message="[Err=REC_LCK@")
		$0:="The record pointed to by the specified C01 code is locked."
		EW_ErrorHandling(False:C215)
		
	: ($_t_Message="[Err=MUL_REC]")
		$0:="The record pointed to by the specified C01 code exists twice."
		EW_ErrorHandling(False:C215)
		
	: ($_t_Message="[Err=STO_PRT]")
		$0:="The store does not accept requests."
		EW_ErrorHandling(True:C214)
		
	: ($_t_Message="[Err=TIM_OUT")
		$0:="Timeout on connection to server."
		EW_ErrorHandling(True:C214)
		
	: ($_t_Message="[Err] 4DBKStoreSet : demo time has expired for this store @")
		$0:="The Business Kit demo time has expired."
		EW_ErrorHandling(True:C214)
		
	: ($_t_Message="CUS_UNK")
		$0:="Unknown customer."
		EW_ErrorHandling(False:C215)
		
	: ($_t_Message="HTTP/1.0 400 Bad Req")
		$0:="HTTP Error 400"
		EW_ErrorHandling(True:C214)
		
	: (Position:C15("CUS_PRT"; $_t_Message)>0) | (Position:C15("STO_PRT"; $_t_Message)>0)
		$0:="There is a problem with the IP address of the DayBook computer."
		EW_ErrorHandling(True:C214)
		
	: ($_t_Message="[Err=COM_BRK]")
		$0:="There is a problem with the connection to the ecommerce server. "+"The IP address "+[EW_ExportProjects:117]BKIPAddress:22+" does not appear to be correct."
		EW_ErrorHandling(True:C214)
		
	Else 
		$0:="Unknown Business Kit error: "+$_t_Message
		EW_ErrorHandling(False:C215)
End case 
ERR_MethodTrackerReturn("EW_ErrorMessages"; $_t_oldMethodName)