//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_GetValidIPRanges
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/08/2009 19:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>IWS_al_IPEnd;0)
	//ARRAY LONGINT(<>IWS_al_IPStart;0)
	ARRAY TEXT:C222($_at_ValidIPRange; 0)
	C_LONGINT:C283($_l_Index; $_l_SizeofArray)
	C_TEXT:C284(<>Web_t_ServerHandler; $_t_error; $_t_IPAddress; $_t_oldMethodName; IWS_t_CurrentMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_GetValidIPRanges")
//******************************************************************************
//
//Method: IWS_GetValidIPRanges
//
//Written by  John Moore on 11/9/98

//
IWS_t_CurrentMethodName:="IWS_GetValidIPRanges"
//
//******************************************************************************


ARRAY TEXT:C222($_at_ValidIPRange; 0)
LIST TO ARRAY:C288("Valid IP Ranges"; $_at_ValidIPRange)
$_l_SizeofArray:=Size of array:C274($_at_ValidIPRange)
UTI_ArrayResize($_l_SizeofArray; -><>IWS_al_IPStart; -><>IWS_al_IPEnd)
$_t_error:=""

Case of 
	: (<>Web_t_ServerHandler="ITK")
		
		
		For ($_l_Index; 1; $_l_SizeofArray)
			If (Position:C15("-"; $_at_ValidIPRange{$_l_Index})=0)  //it's a single IP address
				$_t_IPAddress:=$_at_ValidIPRange{$_l_Index}
				If (IWS_IsDottedAddress($_t_IPAddress))
					//◊IWS_ai_IPStart{$_l_Index}:=ITK_Name2Addr ($_t_IPAddress)ITK OUT
					//◊IWS_ai_IPEnd{$_l_Index}:=ITK_Name2Addr ($_t_IPAddress)ITK OUT
				Else 
					$_t_error:="ERROR: Invalid IP address in range list!"
				End if 
			Else 
				$_t_IPAddress:=STR_Param($_at_ValidIPRange{$_l_Index}; 1; "-")
				If (IWS_IsDottedAddress($_t_IPAddress))
					//◊IWS_ai_IPStart{$_l_Index}:=ITK_Name2Addr ($_t_IPAddress)ITK OUT
					$_t_IPAddress:=STR_Param($_at_ValidIPRange{$_l_Index}; 2; "-")
					If (IWS_IsDottedAddress($_t_IPAddress))
						//◊IWS_ai_IPEnd{$_l_Index}:=ITK_Name2Addr ($_t_IPAddress)ITK OUT
						If (<>IWS_al_IPStart{$_l_Index}><>IWS_al_IPEnd{$_l_Index})
							$_t_error:="ERROR: Invalid IP range - end value is less than start!"
						End if 
					Else 
						$_t_error:="ERROR: Invalid IP address in range list!"
					End if 
					//◊IWS_ai_IPEnd{$_l_Index}:=ITK_Name2Addr (STR_Param ($_at_ValidIPRange{$_l_Index};2;"-"))ITK OUT
				End if 
			End if   //If (Position("-";$_at_ValidIPRange{$_l_Index})=0)  `it's a single IP address
		End for 
		
		If ($_t_error#"")
			//set no restrictions on range
			UTI_ArrayResize(0; -><>IWS_al_IPStart; -><>IWS_al_IPEnd)
			ALERT:C41($_t_error+" Server has been set to accept all IP addresses!")
		End if 
		
		
	: (<>Web_t_ServerHandler="NTK")
		
		For ($_l_Index; 1; $_l_SizeofArray)
			If (Position:C15("-"; $_at_ValidIPRange{$_l_Index})=0)  //it's a single IP address
				$_t_IPAddress:=$_at_ValidIPRange{$_l_Index}
				If (IWS_IsDottedAddress($_t_IPAddress))
					<>IWS_al_IPStart{$_l_Index}:=IWS_IPAddressToLongint($_t_IPAddress)
					<>IWS_al_IPEnd{$_l_Index}:=IWS_IPAddressToLongint($_t_IPAddress)
				Else 
					$_t_error:="ERROR: Invalid IP address in range list!"
				End if 
			Else 
				$_t_IPAddress:=STR_Param($_at_ValidIPRange{$_l_Index}; 1; "-")
				If (IWS_IsDottedAddress($_t_IPAddress))
					<>IWS_al_IPStart{$_l_Index}:=IWS_IPAddressToLongint($_t_IPAddress)
					$_t_IPAddress:=STR_Param($_at_ValidIPRange{$_l_Index}; 2; "-")
					If (IWS_IsDottedAddress($_t_IPAddress))
						<>IWS_al_IPEnd{$_l_Index}:=IWS_IPAddressToLongint($_t_IPAddress)
						If (<>IWS_al_IPStart{$_l_Index}><>IWS_al_IPEnd{$_l_Index})
							$_t_error:="ERROR: Invalid IP range - end value is less than start!"
						End if 
					Else 
						$_t_error:="ERROR: Invalid IP address in range list!"
					End if 
					<>IWS_al_IPEnd{$_l_Index}:=IWS_IPAddressToLongint(STR_Param($_at_ValidIPRange{$_l_Index}; 2; "-"))
				End if 
			End if   //If (Position("-";$_at_ValidIPRange{$_l_Index})=0)  `it's a single IP address
		End for 
		
		If ($_t_error#"")
			//set no restrictions on range
			UTI_ArrayResize(0; -><>IWS_al_IPStart; -><>IWS_al_IPEnd)
			ALERT:C41($_t_error+" Server has been set to accept all IP addresses!")
		End if 
		
	Else 
		
		
End case 
ERR_MethodTrackerReturn("IWS_GetValidIPRanges"; $_t_oldMethodName)