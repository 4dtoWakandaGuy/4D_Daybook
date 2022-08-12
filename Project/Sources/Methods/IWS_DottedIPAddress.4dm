//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_DottedIPAddress
	//------------------ Method Notes ------------------
	//
	//Method: IWS_DottedIPAddress
	//
	//Written by  John on 4/21/99
	//
	//Purpose: Wrapper for ITK function, to return IP address in dotted form
	//from longint form
	//
	//$1 - longint, IP address
	//$0 - string 15, IP address in dotted form
	//------------------ Revision Control ----------------
	//Date Created: 17/08/2009 19:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_IP; $_l_Quadrant1; $_l_Quadrant2; $_l_Quadrant3; $_l_Quadrant4; $1)
	C_REAL:C285($_r_Remainder)
	C_TEXT:C284(<>Web_t_ServerHandler; $_t_DottedIP; $_t_oldMethodName; $_t_Quadrant1; $_t_Quadrant2; $_t_Quadrant3; $_t_Quadrant4; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_DottedIPAddress")
//LOG_SetMethod ("IWS_DottedIPAddress")
//******************************************************************************


//******************************************************************************



$_l_IP:=$1

//test
//$_l_IP:=(127*16777216)+(22*65536)+(134*256)+(16*1)
//◊WebServerUses:="NTK"

Case of 
	: (<>Web_t_ServerHandler="ITK")
		//$_t_DottedIP:=ITK_Addr2Name ($_l_IP;2) ITK OUT `returns dotted form
		
	: (<>Web_t_ServerHandler="NTK")  //added 17/03/08
		//No  ITK_Addr2Name equiv  in NTK so manually create dotted address
		$_l_Quadrant1:=0
		$_l_Quadrant2:=0
		$_l_Quadrant3:=0
		$_l_Quadrant4:=0
		$_t_Quadrant1:="0"
		$_t_Quadrant2:="0"
		$_t_Quadrant3:="0"
		$_t_Quadrant4:="0"
		$_l_Quadrant1:=$_l_IP\16777216
		$_r_Remainder:=$_l_IP%16777216
		If ($_r_Remainder>0)
			$_l_Quadrant2:=$_r_Remainder\65536
			$_r_Remainder:=$_r_Remainder%65536
			If ($_r_Remainder>0)
				$_l_Quadrant3:=$_r_Remainder\256
				$_r_Remainder:=$_r_Remainder%256
				If ($_r_Remainder>0)
					$_l_Quadrant4:=$_r_Remainder
				End if 
			End if 
		End if 
		$_t_Quadrant1:=String:C10($_l_Quadrant1)
		$_t_Quadrant2:=String:C10($_l_Quadrant2)
		$_t_Quadrant3:=String:C10($_l_Quadrant3)
		$_t_Quadrant4:=String:C10($_l_Quadrant4)
		$_t_DottedIP:=$_t_Quadrant1+"."+$_t_Quadrant2+"."+$_t_Quadrant3+"."+$_t_Quadrant4
	Else 
		
End case 

$0:=$_t_DottedIP

//LOG_ResetMethod
ERR_MethodTrackerReturn("IWS_DottedIPAddress"; $_t_oldMethodName)