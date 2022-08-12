//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_TestBkconnection
	//------------------ Method Notes ------------------
	// EW_TestBkconnection
	// 01/11/02 pb
	// Parameters: $1=the IP address to test  (A30)
	//                     $2 = the port no. (longint)
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($2)
	C_TEXT:C284($_t_oldMethodName; $1; tErrorMsg)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_TestBkconnection")

Case of 
	: ($1="")
		tErrorMsg:="No IP address was specified."
	: ($2=0)
		tErrorMsg:="No port number was specified."
	Else 
		//$t_res:=""
		//t_session:=4DBKC_SessionNew ($1;$2)
		//$x_res:=4DBKC_Execute (t_session;"")
		//$t_res:=BLOB to text($x_res;Text without length )
		//If ($t_res="[err@")
		// this means that a connection could not be made to the BK
		//tErrorMsg:="A connection could not be established with the Business Kit using IP address "+$1+"."
		//End if 
End case 
ERR_MethodTrackerReturn("EW_TestBkconnection"; $_t_oldMethodName)