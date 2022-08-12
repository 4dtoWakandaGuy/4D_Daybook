//%attributes = {}
If (False:C215)
	//Project Method Name:      RR_ZenCartAddressDecode
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/02/2011 15:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(RR_at_AddressFIeldName_1;0)
	//ARRAY TEXT(RR_at_AddressFIeldName_2;0)
	//ARRAY TEXT(RR_at_AddressFIeldName_3;0)
	//ARRAY TEXT(RR_at_AddressFIeldName_4;0)
	//ARRAY TEXT(RR_at_AddressFIeldName_5;0)
	//ARRAY TEXT(RR_at_AddressFIeldName_6;0)
	//ARRAY TEXT(RR_at_AddressFIeldName_7;0)
	//ARRAY TEXT(RR_at_AddressFIeldName_8;0)
	//ARRAY TEXT(RR_at_AddressFIeldName_9;0)
	C_BOOLEAN:C305($_bo_Append; $_bo_Exception; $_bo_Exit; $_bo_NoState)
	C_LONGINT:C283($_l_AddressRow; $_l_ArrayIndex; $_l_CharLength; $_l_CommaPosition; $_l_CountSpaces; $_l_EndofLinePosition; $_l_Index; $_l_Next; $_l_NumofCity; $_l_NumofZip; $_l_offset)
	C_POINTER:C301($_Ptr_AddressVar; $_Ptr_AddressVar2; $2; $3)
	C_TEXT:C284($_t_Address; $_t_AddressLine1; $_t_AddressLines; $_t_AddressOut; $_t_AddressWithCommas; $_t_City; $_t_Country; $_t_Line; $_t_oldMethodName; $_t_State; $_t_State2)
	C_TEXT:C284($_t_StateCode; $_t_Zip; $1; RR_t_AddressBlock; RR_t_AddressFieldData_1; RR_t_AddressFieldData_2; RR_t_AddressFieldData_3; RR_t_AddressFieldData_4; RR_t_AddressFieldData_5; RR_t_AddressFieldData_6; RR_t_AddressFieldData_7)
	C_TEXT:C284(RR_t_AddressFieldData_8; RR_t_AddressFieldData_9)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("RR_ZenCartAddressDecode")
$_t_Address:=""

$_t_Address:=$1
$_t_AddressWithCommas:=""
$_t_Country:=""
$_t_Zip:=""
$_t_City:=""
$_t_State:=""
$_bo_Exception:=False:C215
If ($_t_Address#"")
	$_t_AddressWithCommas:=$_t_Address
	$_l_EndofLinePosition:=Position:C15(Char:C90(13); $_t_Address)
	$_l_CommaPosition:=Position:C15(","; $_t_Address)
	If ($_l_CommaPosition<$_l_EndofLinePosition)
		If ($_l_CommaPosition>0)
			$_t_Address[[$_l_CommaPosition]]:=" "
		End if 
	End if 
	$_l_EndofLinePosition:=Position:C15(Char:C90(13); $_t_Address)
	$_t_AddressLine1:=Substring:C12($_t_Address; 1; $_l_EndofLinePosition)
	$_t_AddressLines:=Substring:C12($_t_Address; $_l_EndofLinePosition+1)
	$_l_EndofLinePosition:=Position:C15(Char:C90(13); $_t_AddressLines)
	$_l_CommaPosition:=Position:C15(","; $_t_Address)
	If ($_l_CommaPosition<$_l_EndofLinePosition)
		If ($_l_CommaPosition>0)
			$_t_AddressLines[[$_l_CommaPosition]]:=" "
		End if 
		
	End if 
	$_t_Address:=$_t_AddressLine1+$_t_AddressLines
	$_t_Address:=Replace string:C233($_t_Address; ","; Char:C90(13))
	$_t_Address:=Replace string:C233($_t_Address; "&quot;"; Char:C90(34))
	$_t_Address:=Replace string:C233($_t_Address; "&amp;"; "&")
	ARRAY TEXT:C222($3->; 0)
	Repeat 
		$_l_CommaPosition:=Position:C15(Char:C90(13); $_t_Address)
		If ($_l_CommaPosition>0)
			$_t_Line:=Substring:C12($_t_Address; 1; $_l_CommaPosition-1)
			If ($_t_Line#"")
				If (($_t_Line="LLC") | ($_t_Line="inc. ")) & (Size of array:C274($3->)=1)
					
					$_t_Address:=Substring:C12($_t_Address; $_l_CommaPosition+1)
					$3->{1}:=$3->{1}+" "+$_t_Line
				Else 
					$_t_Address:=Substring:C12($_t_Address; $_l_CommaPosition+1)
					APPEND TO ARRAY:C911($3->; $_t_Line)
				End if 
			Else 
				$_t_Address:=Substring:C12($_t_Address; $_l_CommaPosition+1)
			End if 
		Else 
			If ($_t_Address#"")
				APPEND TO ARRAY:C911($3->; $_t_Address)
				$_t_Address:=""
			End if 
		End if 
	Until ($_t_Address="")
	
	$_t_Country:=$3->{Size of array:C274($3->)}
	$_l_EndofLinePosition:=Position:C15("South Africa"; $_t_Country)
	If ($_l_EndofLinePosition>1)
		
		$_t_Zip:=Substring:C12($_t_Country; 1; $_l_EndofLinePosition-1)
		$_t_Country:=Substring:C12($_t_Country; $_l_EndofLinePosition)
		INSERT IN ARRAY:C227($3->; Size of array:C274($3->); 1)
		$3->{Size of array:C274($3->)-1}:=$_t_Zip
		$3->{Size of array:C274($3->)}:=$_t_Country
	End if 
	$_l_EndofLinePosition:=Position:C15("United Kingdom"; $_t_Country)
	If ($_l_EndofLinePosition>0)
		$3->{Size of array:C274($3->)}:="UK"
		$_t_Country:=$3->{Size of array:C274($3->)}
	End if 
	$_t_City:=$3->{Size of array:C274($3->)-1}
	
	$_bo_Exit:=False:C215
	Repeat 
		If ($_t_Country#"")
			If ($_t_Country[[1]]=" ")
				$_t_Country:=Substring:C12($_t_Country; 2)
			Else 
				$_bo_Exit:=True:C214
			End if 
		End if 
	Until ($_t_Country="") | ($_bo_Exit=True:C214)
	$_bo_Exit:=False:C215
	Repeat 
		If ($_t_Country#"")
			If ($_t_Country[[Length:C16($_t_Country)]]=" ")
				$_t_Country:=Substring:C12($_t_Country; 1; Length:C16($_t_Country)-1)
			Else 
				$_bo_Exit:=True:C214
			End if 
		End if 
	Until ($_t_Country="") | ($_bo_Exit=True:C214)
	$3->{Size of array:C274($3->)}:=$_t_Country
	QUERY:C277([ADDRESS_FORMATS:74]; [ADDRESS_FORMATS:74]Country_Name:8=$_t_Country)
	ARRAY TEXT:C222($2->; 0)
	ARRAY TEXT:C222($2->; Size of array:C274($3->))
	$2->{Size of array:C274($2->)}:="Country"
	Case of 
		: ($_t_Country="United States") | ($_t_Country="USA")
			
			$2->{Size of array:C274($2->)-1}:="State"
			$_t_State:=$3->{Size of array:C274($3->)-1}
			If ($_t_State#"")
				$_bo_Exit:=False:C215
				Repeat 
					If ($_t_State#"")
						If ($_t_State[[1]]=" ")
							$_t_State:=Substring:C12($_t_State; 2)
						Else 
							$_bo_Exit:=True:C214
						End if 
					Else 
						$_bo_Exit:=True:C214
					End if 
				Until ($_bo_Exit)
			End if 
			
			$_l_CharLength:=Length:C16($_t_State)
			$_t_Zip:=""
			$_t_StateCode:=""
			
			$_t_State2:=""
			If ($_t_State#"")
				Repeat 
					$_t_Zip:=Substring:C12($_t_State; $_l_CharLength)
					$_t_State2:=Substring:C12($_t_State; 1; $_l_CharLength-1)
					$_bo_Exit:=False:C215
					Repeat 
						If ($_t_State2#"")
							If ($_t_State2[[Length:C16($_t_State2)]]=" ")
								$_t_State2:=Substring:C12($_t_State; 1; Length:C16($_t_State2)-1)
							Else 
								$_bo_Exit:=True:C214
							End if 
							
						Else 
							$_bo_Exit:=True:C214
						End if 
					Until ($_bo_Exit)
					If (Length:C16($_t_State2)>2)
						$_t_StateCode:=Get_USAstateCodes($_t_State2)
					End if 
					If ($_t_StateCode="")
						$_l_CharLength:=$_l_CharLength-1
					End if 
				Until ($_t_StateCode#"") | ($_l_CharLength=1)
				If ($_t_StateCode#"")
					If ($_t_Zip#"")
						$_bo_Exit:=False:C215
						Repeat 
							If ($_t_Zip#"")
								If ($_t_Zip[[1]]=" ")
									$_t_Zip:=Substring:C12($_t_Zip; 2)
								Else 
									$_bo_Exit:=True:C214
								End if 
							Else 
								$_bo_Exit:=True:C214
							End if 
						Until ($_bo_Exit)
						INSERT IN ARRAY:C227($3->; Size of array:C274($3->); 1)
						INSERT IN ARRAY:C227($2->; Size of array:C274($2->); 1)
						$2->{Size of array:C274($2->)-1}:="ZIP"
						$3->{Size of array:C274($3->)-1}:=$_t_Zip
						$2->{Size of array:C274($2->)-2}:="State"
						$3->{Size of array:C274($3->)-2}:=$_t_State2
						$_l_Next:=Size of array:C274($2->)-3
					Else 
						$2->{Size of array:C274($2->)-1}:="STATE"
						$3->{Size of array:C274($3->)-1}:=$_t_State
						$_l_Next:=Size of array:C274($2->)-2
					End if 
					$2->{$_l_Next}:="City"
					$_l_Next:=$_l_Next-1
					
				Else 
					$2->{Size of array:C274($2->)-1}:="STATE"
					$3->{Size of array:C274($3->)-1}:=$_t_State
					$_l_Next:=Size of array:C274($2->)-3
				End if 
			Else 
				$2->{Size of array:C274($2->)-1}:="STATE"
				$_l_Next:=Size of array:C274($2->)-3
			End if 
			Case of 
				: (Size of array:C274($2->)=6)
					$2->{$_l_Next}:="Address Line1"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Name"
				: (Size of array:C274($2->)=7)
					If (Num:C11($3->{2})=0)
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Company"
					Else 
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
					End if 
				: (Size of array:C274($2->)=8)
					If (Num:C11($3->{2})=0)
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Company"
					Else 
						$2->{$_l_Next}:="Address Line3"
						$_l_Next:=$_l_Next-1
						
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Company"
					End if 
				: (Size of array:C274($2->)=9)
					$2->{$_l_Next}:="Address Line3"
					$_l_Next:=$_l_Next-1
					
					$2->{$_l_Next}:="Address Line2"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Address Line1"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Name"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Company"
				Else 
					//TRACE
			End case 
			$_t_AddressOut:=""
			For ($_l_ArrayIndex; 1; Size of array:C274($2->))
				$_t_AddressOut:=$_t_AddressOut+$2->{$_l_ArrayIndex}+":"+$3->{$_l_ArrayIndex}+Char:C90(13)
			End for 
			//Gen_Alert ($_t_AddressOut)
		: ($_t_Country="Canada")
			
			//almost the same as US except no State lookup
			$2->{Size of array:C274($2->)-1}:="State"
			$_t_State:=$3->{Size of array:C274($3->)-1}
			If ($_t_State#"")
				$_bo_Exit:=False:C215
				Repeat 
					If ($_t_State#"")
						If ($_t_State[[1]]=" ")
							$_t_State:=Substring:C12($_t_State; 2)
						Else 
							$_bo_Exit:=True:C214
						End if 
					Else 
						$_bo_Exit:=True:C214
					End if 
				Until ($_bo_Exit)
			End if 
			
			$_l_CharLength:=Length:C16($_t_State)
			$_t_Zip:=""
			$_t_StateCode:=""
			//Canadian postal codes are like british ones. space in them
			$_l_CountSpaces:=0
			$_t_State2:=""
			If ($_t_State#"")
				Repeat 
					If ($_t_State[[$_l_CharLength]]=" ")
						If ($_l_CountSpaces=0)
							$_l_CountSpaces:=1
							$_l_CharLength:=$_l_CharLength-1
						Else 
							$_t_Zip:=Substring:C12($_t_State; $_l_CharLength+1)
							$_t_State2:=Substring:C12($_t_State; 1; $_l_CharLength-1)
							
						End if 
					Else 
						$_l_CharLength:=$_l_CharLength-1
					End if 
				Until ($_t_State2#"") | ($_l_CharLength=1)
				If ($_t_State2#"")
					If ($_t_Zip#"")
						$_bo_Exit:=False:C215
						Repeat 
							If ($_t_Zip#"")
								If ($_t_Zip[[1]]=" ")
									$_t_Zip:=Substring:C12($_t_Zip; 2)
								Else 
									$_bo_Exit:=True:C214
								End if 
							Else 
								$_bo_Exit:=True:C214
							End if 
						Until ($_bo_Exit)
						INSERT IN ARRAY:C227($3->; Size of array:C274($3->); 1)
						INSERT IN ARRAY:C227($2->; Size of array:C274($2->); 1)
						$2->{Size of array:C274($2->)-1}:="ZIP"
						$3->{Size of array:C274($3->)-1}:=$_t_Zip
						$2->{Size of array:C274($2->)-2}:="State"
						$3->{Size of array:C274($3->)-2}:=$_t_State2
						$_l_Next:=Size of array:C274($3->)-3
					Else 
						$2->{Size of array:C274($2->)-1}:="STATE"
						$3->{Size of array:C274($3->)-1}:=$_t_State
						$_l_Next:=Size of array:C274($3->)-2
					End if 
					$2->{$_l_Next}:="City"
					$_l_Next:=$_l_Next-1
					
				Else 
					$2->{Size of array:C274($2->)-1}:="STATE"
					$3->{Size of array:C274($3->)-1}:=$_t_State
					$_l_Next:=2
				End if 
			Else 
				$2->{Size of array:C274($2->)-1}:="STATE"
				$_l_Next:=2
			End if 
			Case of 
				: (Size of array:C274($2->)=6)
					$2->{$_l_Next}:="Address Line1"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Name"
					
				: (Size of array:C274($2->)=7)
					If (Num:C11($3->{2})=0)
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Company"
					Else 
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
					End if 
				: (Size of array:C274($2->)=8)
					If (Num:C11($3->{2})=0)
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Company"
					Else 
						$2->{$_l_Next}:="Address Line3"
						$_l_Next:=$_l_Next-1
						
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						//$_l_Next:=$_l_Next-1
						//$2->{$_l_Next}:="Name"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Company"
					End if 
				: (Size of array:C274($2->)=9)
					$2->{$_l_Next}:="Address Line3"
					$_l_Next:=$_l_Next-1
					
					$2->{$_l_Next}:="Address Line2"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Address Line1"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Name"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Company"
				Else 
					//TRACE
			End case 
			$_t_AddressOut:=""
			For ($_l_ArrayIndex; 1; Size of array:C274($2->))
				$_t_AddressOut:=$_t_AddressOut+$2->{$_l_ArrayIndex}+":"+$3->{$_l_ArrayIndex}+Char:C90(13)
			End for 
			//Gen_Alert ($_t_AddressOut)
		: ($_t_Country="Argentina") | ($_t_Country="Uruguay")
			
			//postal code + city/town/locality.  Yes, currently (writing as of March 2005) an Argentina postal code ("CPA") has one letter + four digits + three letters.]
			$2->{Size of array:C274($2->)-1}:="City"
			$_t_City:=$3->{Size of array:C274($3->)-1}
			$_l_EndofLinePosition:=Position:C15(" "; $_t_City)
			$_t_Zip:=""
			If ($_l_EndofLinePosition>0)
				$_t_Zip:=Substring:C12($_t_City; 1; $_l_EndofLinePosition-1)
				$_t_City:=Substring:C12($_t_City; $_l_EndofLinePosition+1)
			End if 
			If ($_t_City#"")
				$_bo_Exit:=False:C215
				Repeat 
					If ($_t_City#"")
						If ($_t_City[[1]]=" ")
							$_t_City:=Substring:C12($_t_City; 2)
						Else 
							$_bo_Exit:=True:C214
						End if 
					Else 
						$_bo_Exit:=True:C214
					End if 
				Until ($_bo_Exit)
			End if 
			$_l_CharLength:=Length:C16($_t_Zip)
			Repeat 
				If ($_t_Zip[[$_l_CharLength]]=" ")
					$_t_Zip:=Substring:C12($_t_Zip; 1; $_l_CharLength-1)
					$_l_CharLength:=Length:C16($_t_Zip)
				Else 
					$_l_CharLength:=1
				End if 
			Until ($_t_Zip[[$_l_CharLength]]#" ") | ($_l_CharLength=1)
			INSERT IN ARRAY:C227($3->; Size of array:C274($3->)-1; 1)
			INSERT IN ARRAY:C227($2->; Size of array:C274($2->)-1; 1)
			$2->{Size of array:C274($2->)-2}:="ZIP"
			$3->{Size of array:C274($3->)-2}:=$_t_Zip
			$2->{Size of array:C274($2->)-1}:="City"
			$3->{Size of array:C274($3->)-1}:=$_t_City
			$_l_Next:=Size of array:C274($3->)-3
			Case of 
				: (Size of array:C274($2->)=5)
					$2->{$_l_Next}:="Address Line1"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Name"
					//$_l_Next:=$_l_Next-1
					//$2»{$_l_Next}:="Company"
				: (Size of array:C274($2->)=6)
					If (Position:C15("S.A"; $3->{Size of array:C274($3->)-($_l_Next+1)})>0)
						
						
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Company"
					Else 
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
					End if 
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Name"
				: (Size of array:C274($2->)=7)
					$2->{$_l_Next}:="Address Line3"
					$_l_Next:=$_l_Next-1
					
					$2->{$_l_Next}:="Address Line2"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Address Line1"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Name"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Company"
				Else 
					//TRACE
			End case 
			$_t_AddressOut:=""
			For ($_l_ArrayIndex; 1; Size of array:C274($2->))
				$_t_AddressOut:=$_t_AddressOut+$2->{$_l_ArrayIndex}+":"+$3->{$_l_ArrayIndex}+Char:C90(13)
			End for 
		: ($_t_Country="Australia")
			
			//City State Code Zip-one line
			//use GEN_GetAustralianStateCodes
			$2->{Size of array:C274($2->)-1}:="State"
			$2->{Size of array:C274($2->)-2}:="Zip"
			$_t_State:=$3->{Size of array:C274($3->)-1}
			$_l_Next:=Size of array:C274($2->)-3
			$2->{$_l_Next}:="City"
			$_l_Next:=$_l_Next-1
			Case of 
				: (Size of array:C274($2->)=6)
					
					$2->{$_l_Next}:="Address Line1"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Name"
				: (Size of array:C274($2->)=7)
					If (Num:C11($3->{2})=0)
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Company"
					Else 
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
					End if 
				: (Size of array:C274($2->)=8)
					If (Num:C11($3->{2})=0)
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Company"
					Else 
						$2->{$_l_Next}:="Address Line3"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
					End if 
				: (Size of array:C274($2->)=9)
					$2->{$_l_Next}:="Address Line3"
					$_l_Next:=$_l_Next-1
					
					$2->{$_l_Next}:="Address Line2"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Address Line1"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Name"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Company"
				Else 
					//TRACE
			End case 
			$_t_AddressOut:=""
			For ($_l_ArrayIndex; 1; Size of array:C274($2->))
				$_t_AddressOut:=$_t_AddressOut+$2->{$_l_ArrayIndex}+":"+$3->{$_l_ArrayIndex}+Char:C90(13)
			End for 
		: ($_t_Country="Austria")
			
			$_t_City:=$3->{Size of array:C274($3->)-1}
			$_l_EndofLinePosition:=Position:C15(" "; $_t_City)
			$_t_Zip:=""
			If ($_l_EndofLinePosition>0)
				$_t_Zip:=Substring:C12($_t_City; 1; $_l_EndofLinePosition-1)
				$_t_City:=Substring:C12($_t_City; $_l_EndofLinePosition+1)
			End if 
			INSERT IN ARRAY:C227($3->; Size of array:C274($3->)-1; 1)
			INSERT IN ARRAY:C227($2->; Size of array:C274($2->)-1; 1)
			$2->{Size of array:C274($2->)-1}:="City"
			$2->{Size of array:C274($2->)-2}:="Zip"
			$3->{Size of array:C274($3->)-1}:=$_t_City
			$3->{Size of array:C274($3->)-2}:=$_t_Zip
			$_l_Next:=Size of array:C274($2->)-3
			Case of 
				: (Size of array:C274($2->)=5)
					$2->{$_l_Next}:="Address Line1"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Name"
				: (Size of array:C274($2->)=6)
					If (Num:C11($3->{2})=0)
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Company"
					Else 
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
					End if 
				: (Size of array:C274($2->)=7)
					If (Num:C11($3->{2})=0)
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Company"
					Else 
						$2->{$_l_Next}:="Address Line3"
						$_l_Next:=$_l_Next-1
						
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
					End if 
				: (Size of array:C274($2->)=8)
					$2->{$_l_Next}:="Address Line3"
					$_l_Next:=$_l_Next-1
					
					$2->{$_l_Next}:="Address Line2"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Address Line1"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Name"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Company"
				Else 
					//TRACE
			End case 
			$_t_AddressOut:=""
			For ($_l_ArrayIndex; 1; Size of array:C274($2->))
				$_t_AddressOut:=$_t_AddressOut+$2->{$_l_ArrayIndex}+":"+$3->{$_l_ArrayIndex}+Char:C90(13)
			End for 
		: ($_t_Country="Greece")
			//TRACE
			$2->{Size of array:C274($2->)-1}:="State"
			$2->{Size of array:C274($2->)-2}:="Zip"
			$2->{Size of array:C274($2->)-3}:="City"
			$_l_Next:=Size of array:C274($2->)-4
			$_bo_NoState:=False:C215
			Case of 
				: (Size of array:C274($2->)=6)
					If (Num:C11($3->{2})=0) | ($_bo_NoState)
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Company"
						
					Else 
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
					End if 
				: (Size of array:C274($2->)=7)
					If (Num:C11($3->{2})=0) | ($_bo_NoState)
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Company"
					Else 
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
					End if 
				: (Size of array:C274($2->)=8)
					If (Num:C11($3->{2})=0) | ($_bo_NoState)
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Company"
					Else 
						$2->{$_l_Next}:="Address Line3"
						$_l_Next:=$_l_Next-1
						
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
					End if 
				: (Size of array:C274($2->)=9)
					$2->{$_l_Next}:="Address Line3"
					$_l_Next:=$_l_Next-1
					
					$2->{$_l_Next}:="Address Line2"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Address Line1"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Name"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Company"
				Else 
					$_bo_Exception:=True:C214
					//TRACE
			End case 
			$_t_AddressOut:=""
			For ($_l_ArrayIndex; 1; Size of array:C274($2->))
				$_t_AddressOut:=$_t_AddressOut+$2->{$_l_ArrayIndex}+":"+$3->{$_l_ArrayIndex}+Char:C90(13)
			End for 
		: ($_t_Country="Belgium") | ($_t_Country="Denmark") | ($_t_Country="Estonia") | ($_t_Country="France") | ($_t_Country="Germany") | ($_t_Country="Greenland") | ($_t_Country="Iceland") | ($_t_Country="Italy") | ($_t_Country="Luxembourg") | ($_t_Country="Netherlands") | ($_t_Country="Poland") | ($_t_Country="Portugal") | ($_t_Country="Romania") | ($_t_Country="Spain") | ($_t_Country="Sweden") | ($_t_Country="Switzerland") | ($_t_Country="Greece")
			
			$2->{Size of array:C274($2->)-1}:="State"
			
			$_t_State:=$3->{Size of array:C274($3->)-1}
			$_l_EndofLinePosition:=Position:C15(" "; $_t_State)
			
			
			$_t_Zip:=Substring:C12($_t_State; 1; $_l_EndofLinePosition-1)
			$_l_NumofZip:=Num:C11($_t_Zip)
			If ($_l_NumofZip>0)
				INSERT IN ARRAY:C227($2->; Size of array:C274($2->)-1; 1)
				INSERT IN ARRAY:C227($3->; Size of array:C274($3->)-1; 1)
				$3->{Size of array:C274($3->)-2}:=Substring:C12($_t_State; 1; $_l_EndofLinePosition-1)
				$3->{Size of array:C274($3->)-1}:=Substring:C12($_t_State; $_l_EndofLinePosition+1)
				$2->{Size of array:C274($2->)-2}:="Zip"
				$_l_Next:=Size of array:C274($2->)-3
				$_bo_NoState:=False:C215
				$_l_NumofCity:=Num:C11($3->{Size of array:C274($3->)-3})
				
				If ($_l_NumofCity>0)
					//thisi is an address line so there was no state
					$_bo_NoState:=True:C214
					$2->{Size of array:C274($2->)-1}:="City"
				End if 
			Else 
				$_bo_NoState:=True:C214
				$_l_Next:=Size of array:C274($2->)-2
				$2->{$_l_Next}:="ZIP"
				$_l_Next:=$_l_Next-1
				$2->{$_l_Next}:="City"
				$_l_Next:=$_l_Next-1
			End if 
			If ($_bo_NoState=False:C215)
				$2->{$_l_Next}:="City"
				$_l_Next:=$_l_Next-1
			End if 
			Case of 
				: (Size of array:C274($2->)=5)
					
					$2->{$_l_Next}:="Address Line1"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Name"
					
				: (Size of array:C274($2->)=6)
					If (Num:C11($3->{2})=0) | ($_bo_NoState)
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Company"
						
					Else 
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
					End if 
				: (Size of array:C274($2->)=7)
					If (Num:C11($3->{2})=0) | ($_bo_NoState)
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Company"
					Else 
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
					End if 
				: (Size of array:C274($2->)=8)
					If (Num:C11($3->{2})=0) | ($_bo_NoState)
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Company"
					Else 
						$2->{$_l_Next}:="Address Line3"
						$_l_Next:=$_l_Next-1
						
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
					End if 
				: (Size of array:C274($2->)=9)
					$2->{$_l_Next}:="Address Line3"
					$_l_Next:=$_l_Next-1
					
					$2->{$_l_Next}:="Address Line2"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Address Line1"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Name"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Company"
				Else 
					$_bo_Exception:=True:C214
			End case 
			$_t_AddressOut:=""
			For ($_l_ArrayIndex; 1; Size of array:C274($2->))
				$_t_AddressOut:=$_t_AddressOut+$2->{$_l_ArrayIndex}+":"+$3->{$_l_ArrayIndex}+Char:C90(13)
			End for 
			//[postal code + city/town/locality]
		: ($_t_Country="Malaysia")
			
			$2->{Size of array:C274($2->)-1}:="State"
			$_t_City:=$3->{Size of array:C274($3->)-2}
			$_l_EndofLinePosition:=Position:C15(" "; $_t_City)
			$_t_Zip:=""
			If ($_l_EndofLinePosition>0)
				$_t_Zip:=Substring:C12($_t_City; 1; $_l_EndofLinePosition-1)
				$_t_City:=Substring:C12($_t_City; $_l_EndofLinePosition+1)
			End if 
			INSERT IN ARRAY:C227($3->; Size of array:C274($3->)-2; 1)
			INSERT IN ARRAY:C227($2->; Size of array:C274($2->)-2; 1)
			$2->{Size of array:C274($2->)-2}:="City"
			$2->{Size of array:C274($2->)-3}:="Zip"
			$3->{Size of array:C274($3->)-2}:=$_t_City
			$3->{Size of array:C274($3->)-3}:=$_t_Zip
			$_l_Next:=Size of array:C274($2->)-4
			Case of 
				: (Size of array:C274($2->)=6)
					$2->{$_l_Next}:="Address Line1"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Name"
				: (Size of array:C274($2->)=7)
					If (Num:C11($3->{2})=0)
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Company"
					Else 
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
					End if 
				: (Size of array:C274($2->)=8)
					If (Num:C11($3->{2})=0)
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Company"
					Else 
						$2->{$_l_Next}:="Address Line3"
						$_l_Next:=$_l_Next-1
						
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
					End if 
				: (Size of array:C274($2->)=9)
					$2->{$_l_Next}:="Address Line3"
					$_l_Next:=$_l_Next-1
					
					$2->{$_l_Next}:="Address Line2"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Address Line1"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Name"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Company"
				Else 
					$_bo_Exception:=True:C214
			End case 
			$_t_AddressOut:=""
			For ($_l_ArrayIndex; 1; Size of array:C274($2->))
				$_t_AddressOut:=$_t_AddressOut+$2->{$_l_ArrayIndex}+":"+$3->{$_l_ArrayIndex}+Char:C90(13)
			End for 
			//[postal code + city/town
			//state
		: ($_t_Country="Singapore") | ($_t_Country="Republic of SIngapore") | ($_t_Country="South Korea") | ($_t_Country="Taiwan")
			
			$2->{Size of array:C274($2->)-1}:="State"
			$_t_City:=$3->{Size of array:C274($3->)-1}
			$_l_EndofLinePosition:=Position:C15(" "; $_t_City)
			$_t_Zip:=""
			If ($_l_EndofLinePosition>0)
				$_t_Zip:=Substring:C12($_t_City; $_l_EndofLinePosition+1)
				$_t_City:=Substring:C12($_t_City; 1; $_l_EndofLinePosition-1)
				
			End if 
			INSERT IN ARRAY:C227($3->; Size of array:C274($3->)-1; 1)
			INSERT IN ARRAY:C227($2->; Size of array:C274($2->)-1; 1)
			$2->{Size of array:C274($2->)-1}:="City"
			$2->{Size of array:C274($2->)-2}:="Zip"
			$3->{Size of array:C274($3->)-1}:=$_t_City
			$3->{Size of array:C274($3->)-2}:=$_t_Zip
			$_l_Next:=Size of array:C274($2->)-3
			Case of 
				: (Size of array:C274($2->)=5)
					$2->{$_l_Next}:="Address Line1"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Name"
				: (Size of array:C274($2->)=6)
					If (Num:C11($3->{2})=0)
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Company"
					Else 
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
					End if 
				: (Size of array:C274($2->)=7)
					If (Num:C11($3->{2})=0)
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Company"
					Else 
						$2->{$_l_Next}:="Address Line3"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
					End if 
					
				: (Size of array:C274($2->)=8)
					$2->{$_l_Next}:="Address Line3"
					$_l_Next:=$_l_Next-1
					
					$2->{$_l_Next}:="Address Line2"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Address Line1"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Name"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Company"
				Else 
					$_bo_Exception:=True:C214
			End case 
			//watch out for commas
			//city/town [postal code +
			$_t_AddressOut:=""
			For ($_l_ArrayIndex; 1; Size of array:C274($2->))
				$_t_AddressOut:=$_t_AddressOut+$2->{$_l_ArrayIndex}+":"+$3->{$_l_ArrayIndex}+Char:C90(13)
			End for 
		: ($_t_Country="New Zealand")
			
			
			$2->{Size of array:C274($2->)-1}:="Zip"
			$_t_City:=$3->{Size of array:C274($3->)-1}
			$_l_EndofLinePosition:=Length:C16($_t_City)
			$_bo_Exit:=False:C215
			Repeat 
				If ($_t_City[[$_l_EndofLinePosition]]=" ")
					$_t_Zip:=Substring:C12($_t_City; $_l_EndofLinePosition+1)
					$_t_City:=Substring:C12($_t_City; 1; $_l_EndofLinePosition-1)
					$_bo_Exit:=True:C214
				Else 
					$_l_EndofLinePosition:=$_l_EndofLinePosition-1
				End if 
			Until ($_bo_Exit=True:C214) | ($_l_EndofLinePosition=1)
			INSERT IN ARRAY:C227($3->; Size of array:C274($3->)-1; 1)
			INSERT IN ARRAY:C227($2->; Size of array:C274($2->)-1; 1)
			$2->{Size of array:C274($2->)-2}:="City"
			$3->{Size of array:C274($3->)-1}:=$_t_Zip
			$3->{Size of array:C274($3->)-2}:=$_t_City
			$_l_Next:=Size of array:C274($2->)-3
			Case of 
				: (Size of array:C274($2->)=5)
					$2->{$_l_Next}:="Address Line1"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Name"
				: (Size of array:C274($2->)=6)
					//count be no company...
					If (Num:C11($3->{2})=0)
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Company"
					Else 
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
					End if 
				: (Size of array:C274($2->)=7)
					//could be no company...
					If (Num:C11($3->{2})=0)
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Company"
					Else 
						$2->{$_l_Next}:="Address Line3"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
					End if 
				: (Size of array:C274($2->)=8)
					$2->{$_l_Next}:="Address Line3"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Address Line2"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Address Line1"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Name"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Company"
				Else 
					$_bo_Exception:=True:C214
			End case 
			$_t_AddressOut:=""
			For ($_l_ArrayIndex; 1; Size of array:C274($2->))
				$_t_AddressOut:=$_t_AddressOut+$2->{$_l_ArrayIndex}+":"+$3->{$_l_ArrayIndex}+Char:C90(13)
			End for 
			// city/town post code
			//new zealand
		: ($_t_Country="Mexico")
			
			
			//[recipient name]
			//  [street address]
			//  [postal code+city, province/state abbreviation]
			// [country name]
			
			
			$2->{Size of array:C274($2->)-1}:="State"
			$_t_City:=$3->{Size of array:C274($3->)-2}
			//contains city province and post code
			$_l_EndofLinePosition:=Position:C15(" "; $_t_City)
			$_t_Zip:=""
			If ($_l_EndofLinePosition>0)
				$_t_Zip:=Substring:C12($_t_City; 1; $_l_EndofLinePosition-1)
				$_t_City:=Substring:C12($_t_City; $_l_EndofLinePosition+1)
				
				
			End if 
			//$_t_City:=Replace string($_t_City;$_t_State)
			If (False:C215)
				//STILL CONTAINS PROVINE
				//$_l_EndofLinePosition:=Length($_t_City)
				$_bo_Exit:=False:C215
				Repeat 
					If ($_t_City[[$_l_EndofLinePosition]]=" ")
						$_t_Zip:=Substring:C12($_t_City; $_l_EndofLinePosition+1)
						$_t_City:=Substring:C12($_t_City; 1; $_l_EndofLinePosition-1)
						$_bo_Exit:=True:C214
					Else 
						$_l_EndofLinePosition:=$_l_EndofLinePosition-1
					End if 
				Until ($_bo_Exit=True:C214) | ($_l_EndofLinePosition=1)
			End if 
			INSERT IN ARRAY:C227($3->; Size of array:C274($3->)-1; 1)
			INSERT IN ARRAY:C227($2->; Size of array:C274($2->)-1; 1)
			$2->{Size of array:C274($2->)-2}:="City"
			$2->{Size of array:C274($2->)-3}:="Zip"
			$3->{Size of array:C274($3->)-3}:=$_t_Zip
			$3->{Size of array:C274($3->)-2}:=$_t_City
			$_l_Next:=Size of array:C274($2->)-4
			Case of 
				: (Size of array:C274($2->)=6)
					$2->{$_l_Next}:="Address Line1"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Name"
				: (Size of array:C274($2->)=7)
					//count be no company...
					If (Num:C11($3->{2})=0)
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Company"
					Else 
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
					End if 
				: (Size of array:C274($2->)=8)
					//could be no company...
					If (Num:C11($3->{2})=0)
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Company"
					Else 
						$2->{$_l_Next}:="Address Line3"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
					End if 
				: (Size of array:C274($2->)=9)
					$2->{$_l_Next}:="Address Line3"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Address Line2"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Address Line1"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Name"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Company"
				Else 
					$_bo_Exception:=True:C214
			End case 
			$_t_AddressOut:=""
			For ($_l_ArrayIndex; 1; Size of array:C274($2->))
				$_t_AddressOut:=$_t_AddressOut+$2->{$_l_ArrayIndex}+":"+$3->{$_l_ArrayIndex}+Char:C90(13)
			End for 
			// city/town post code
			
		: ($_t_Country="South Africa") | ($_t_Country="Ukrain") | ($_t_Country="Brazil") | ($_t_Country="India") | ($_t_Country="Pakistan")
			
			$_l_Next:=Size of array:C274($2->)
			$2->{$_l_Next}:="Country"
			$_l_Next:=$_l_Next-1
			$2->{$_l_Next}:="Zip"
			//ciry
			$_l_Next:=$_l_Next-1
			$2->{$_l_Next}:="City"
			$_l_Next:=$_l_Next-1
			//post code
			//south africa
			Case of 
				: (Size of array:C274($2->)=5)
					$2->{$_l_Next}:="Address Line1"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Name"
				: (Size of array:C274($2->)=6)
					//count be no company...
					If (Num:C11($3->{2})=0)
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Company"
					Else 
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
					End if 
				: (Size of array:C274($2->)=7)
					//could be no company...
					If (Num:C11($3->{2})=0)
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Company"
					Else 
						$2->{$_l_Next}:="Address Line3"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
					End if 
				: (Size of array:C274($2->)=8)
					$2->{$_l_Next}:="Address Line3"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Address Line2"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Address Line1"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Name"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Company"
				Else 
					$_bo_Exception:=True:C214
			End case 
			$_t_AddressOut:=""
			For ($_l_ArrayIndex; 1; Size of array:C274($2->))
				$_t_AddressOut:=$_t_AddressOut+$2->{$_l_ArrayIndex}+":"+$3->{$_l_ArrayIndex}+Char:C90(13)
			End for 
			
			//City on one line
			//zip on next-no states
		: ($_t_Country="UK") | ($_t_Country="England") | ($_t_Country="Scotland") | ($_t_Country="Wales") | ($_t_Country="Russia") | ($_t_Country="United Kingdom")
			//cirty
			//county
			//zip seperate lines
			$_l_Next:=Size of array:C274($2->)
			$2->{$_l_Next}:="Country"
			$_l_Next:=$_l_Next-1
			$2->{$_l_Next}:="Zip"
			$_l_Next:=$_l_Next-1
			$2->{$_l_Next}:="County"
			//ciry
			$_l_Next:=$_l_Next-1
			$2->{$_l_Next}:="City"
			$_l_Next:=$_l_Next-1
			//post code
			//south africa
			Case of 
				: (Size of array:C274($2->)=6)
					$2->{$_l_Next}:="Address Line1"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Name"
				: (Size of array:C274($2->)=7)
					//count be no company...
					If (Num:C11($3->{2})=0)
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Company"
					Else 
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
					End if 
				: (Size of array:C274($2->)=8)
					//could be no company...
					If (Num:C11($3->{2})=0)
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Company"
					Else 
						$2->{$_l_Next}:="Address Line3"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
					End if 
				: (Size of array:C274($2->)=9)
					$2->{$_l_Next}:="Address Line3"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Address Line2"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Address Line1"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Name"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Company"
				Else 
					$_bo_Exception:=True:C214
			End case 
			$_t_AddressOut:=""
			For ($_l_ArrayIndex; 1; Size of array:C274($2->))
				$_t_AddressOut:=$_t_AddressOut+$2->{$_l_ArrayIndex}+":"+$3->{$_l_ArrayIndex}+Char:C90(13)
			End for 
			
			//cirty
			//county zip
		: ($_t_Country="China")
			
			//[number+street name, city]
			// [postcode+province]
			$_t_State:=$3->{Size of array:C274($3->)-1}
			$_l_EndofLinePosition:=Position:C15(" "; $_t_State)
			$_t_Zip:=""
			If ($_l_EndofLinePosition>0)
				$_t_Zip:=Substring:C12($_t_State; 1; $_l_EndofLinePosition-1)
				$_t_State:=Substring:C12($_t_State; $_l_EndofLinePosition+1)
			End if 
			INSERT IN ARRAY:C227($3->; Size of array:C274($3->)-1; 1)
			INSERT IN ARRAY:C227($2->; Size of array:C274($2->)-1; 1)
			$2->{Size of array:C274($2->)-1}:="State"
			$2->{Size of array:C274($2->)-2}:="Zip"
			$3->{Size of array:C274($3->)-1}:=$_t_State
			$3->{Size of array:C274($3->)-2}:=$_t_Zip
			$_l_Next:=Size of array:C274($2->)-3
			$2->{$_l_Next}:="City"
			$_l_Next:=$_l_Next-1
			Case of 
				: (Size of array:C274($2->)=6)
					$2->{$_l_Next}:="Address Line1"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Name"
				: (Size of array:C274($2->)=7)
					If (Num:C11($3->{2})=0)
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Company"
					Else 
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
					End if 
				: (Size of array:C274($2->)=8)
					If (Num:C11($3->{2})=0)
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Company"
					Else 
						$2->{$_l_Next}:="Address Line3"
						$_l_Next:=$_l_Next-1
						
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
					End if 
				: (Size of array:C274($2->)=9)
					$2->{$_l_Next}:="Address Line3"
					$_l_Next:=$_l_Next-1
					
					$2->{$_l_Next}:="Address Line2"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Address Line1"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Name"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Company"
				Else 
					$_bo_Exception:=True:C214
			End case 
			$_t_AddressOut:=""
			For ($_l_ArrayIndex; 1; Size of array:C274($2->))
				$_t_AddressOut:=$_t_AddressOut+$2->{$_l_ArrayIndex}+":"+$3->{$_l_ArrayIndex}+Char:C90(13)
			End for 
		: ($_t_Country="Japan")
			
			//'house number' area  city
			//area(state) postal code
			//*actually house number is not a house number its a subarea block and building number
			$_t_City:=$3->{Size of array:C274($3->)-1}
			$_t_Zip:=""
			
			If ($_t_City#"")
				$_bo_Exit:=False:C215
				Repeat 
					If ($_t_City#"")
						If ($_t_City[[1]]=" ")
							$_t_City:=Substring:C12($_t_City; 2)
						Else 
							$_bo_Exit:=True:C214
						End if 
					Else 
						$_bo_Exit:=True:C214
					End if 
				Until ($_bo_Exit)
			End if 
			$_l_CharLength:=Length:C16($_t_City)
			Repeat 
				If ($_t_City[[$_l_CharLength]]=" ")
					$_t_Zip:=Substring:C12($_t_City; $_l_CharLength+1)
					$_t_City:=Substring:C12($_t_City; 1; $_l_CharLength)
					$_l_CharLength:=1
				Else 
					$_l_CharLength:=$_l_CharLength-1
				End if 
			Until ($_l_CharLength=1)
			INSERT IN ARRAY:C227($3->; Size of array:C274($3->)-1; 1)
			INSERT IN ARRAY:C227($2->; Size of array:C274($2->)-1; 1)
			$2->{Size of array:C274($2->)-1}:="State"
			$2->{Size of array:C274($2->)-2}:="Zip"
			$3->{Size of array:C274($3->)-1}:=$_t_City
			$3->{Size of array:C274($3->)-2}:=$_t_Zip
			$_l_Next:=Size of array:C274($3->)-3
			$2->{$_l_Next}:="City"
			$_l_Next:=$_l_Next-1
			Case of 
				: (Size of array:C274($2->)=6)
					$2->{$_l_Next}:="Address Line1"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Name"
				: (Size of array:C274($2->)=7)
					//count be no company...
					If (Num:C11($3->{2})=0)
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Company"
					Else 
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
					End if 
				: (Size of array:C274($2->)=8)
					//could be no company...
					If (Num:C11($3->{2})=0)
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Company"
					Else 
						$2->{$_l_Next}:="Address Line3"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
					End if 
				: (Size of array:C274($2->)=9)
					$2->{$_l_Next}:="Address Line3"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Address Line2"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Address Line1"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Name"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Company"
				Else 
					$_bo_Exception:=True:C214
			End case 
			$_t_AddressOut:=""
			For ($_l_ArrayIndex; 1; Size of array:C274($2->))
				$_t_AddressOut:=$_t_AddressOut+$2->{$_l_ArrayIndex}+":"+$3->{$_l_ArrayIndex}+Char:C90(13)
			End for 
			
			//cirty
			
		: ($_t_Country="Hong Kong")
			$2->{Size of array:C274($2->)-1}:="State"
			$2->{Size of array:C274($2->)-2}:="City"
			$_l_Next:=Size of array:C274($2->)-3
			Case of 
				: (Size of array:C274($2->)=5)
					$2->{$_l_Next}:="Address Line1"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Name"
				: (Size of array:C274($2->)=6)
					//count be no company...
					If (Num:C11($3->{2})=0)
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Company"
					Else 
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
					End if 
				: (Size of array:C274($2->)=7)
					//could be no company...
					If (Num:C11($3->{2})=0)
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Company"
					Else 
						$2->{$_l_Next}:="Address Line3"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
					End if 
				: (Size of array:C274($2->)=8)
					$2->{$_l_Next}:="Address Line3"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Address Line2"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Address Line1"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Name"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Company"
				Else 
					$_bo_Exception:=True:C214
			End case 
			//[number+street name,
			// city]
			// [province] (New Territories)
			//hong Kong
		: ($_t_Country="Fiji")
			//number and street name
			//region
			$2->{Size of array:C274($2->)-1}:="City"
			$_l_Next:=Size of array:C274($2->)-3
			Case of 
				: (Size of array:C274($2->)=4)
					$2->{$_l_Next}:="Address Line1"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Name"
				: (Size of array:C274($2->)=5)
					//count be no company...
					If (Num:C11($3->{2})=0)
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Company"
					Else 
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
					End if 
				: (Size of array:C274($2->)=6)
					//could be no company...
					If (Num:C11($3->{2})=0)
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Company"
					Else 
						$2->{$_l_Next}:="Address Line3"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
					End if 
				: (Size of array:C274($2->)=7)
					$2->{$_l_Next}:="Address Line3"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Address Line2"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Address Line1"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Name"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Company"
				Else 
					$_bo_Exception:=True:C214
			End case 
			//country
		: ($_t_Country="Finland") | ($_t_Country="Norway") | ($_t_Country="Israel")
			//[country code + postal code + postal district.  The "FI-" is an optional country code.]
		: ($_t_Country="Ireland")
			//town where town is dublin or cork no county for those city a numeric 'area' code is used on the same line
			//county ` except cork or dublin
			$2->{Size of array:C274($2->)-1}:="City"
			$_t_City:=$3->{Size of array:C274($3->)-1}
			Case of 
				: (Position:C15("Dublin"; $_t_City)>0)
					$_t_Zip:=Replace string:C233($_t_City; "Dublin"; "")
					$3->{Size of array:C274($3->)-1}:="Dublin"
					INSERT IN ARRAY:C227($3->; Size of array:C274($3->)-1; 1)
					INSERT IN ARRAY:C227($2->; Size of array:C274($2->)-1; 1)
					$2->{Size of array:C274($2->)-1}:="City"
					$2->{Size of array:C274($2->)-2}:="Zip"
					$_l_Next:=Size of array:C274($2->)-3
					$_l_offset:=1
				: (Position:C15("Cork"; $_t_City)>0)
					$_t_Zip:=Replace string:C233($_t_City; "Cork"; "")
					$3->{Size of array:C274($3->)-1}:="Cork"
					INSERT IN ARRAY:C227($3->; Size of array:C274($3->)-1; 1)
					INSERT IN ARRAY:C227($2->; Size of array:C274($2->)-1; 1)
					$2->{Size of array:C274($2->)-1}:="City"
					$2->{Size of array:C274($2->)-2}:="Zip"
					$_l_offset:=1
				Else 
					$_l_Next:=Size of array:C274($2->)-2
					$_l_offset:=0
			End case 
			Case of 
				: (Size of array:C274($2->)=5+$_l_offset)
					$2->{$_l_Next}:="Address Line1"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Name"
				: (Size of array:C274($2->)=6+$_l_offset)
					//count be no company...
					If (Num:C11($3->{2})=0)
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Company"
					Else 
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
					End if 
				: (Size of array:C274($2->)=7+$_l_offset)
					//could be no company...
					If (Num:C11($3->{2})=0)
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Company"
					Else 
						$2->{$_l_Next}:="Address Line3"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
					End if 
				: (Size of array:C274($2->)=8+$_l_offset)
					$2->{$_l_Next}:="Address Line3"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Address Line2"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Address Line1"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Name"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Company"
				Else 
					$_bo_Exception:=True:C214
			End case 
			//ireland
		: ($_t_Country="Oman")
			//post code
			//city
			//oman
			$2->{Size of array:C274($2->)-1}:="City"
			$2->{Size of array:C274($2->)-2}:="Zip"
			Case of 
				: (Size of array:C274($2->)=5)
					$2->{$_l_Next}:="Address Line1"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Name"
				: (Size of array:C274($2->)=6)
					//count be no company...
					If (Num:C11($3->{2})=0)
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Company"
					Else 
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
					End if 
				: (Size of array:C274($2->)=7)
					//could be no company...
					If (Num:C11($3->{2})=0)
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Company"
					Else 
						$2->{$_l_Next}:="Address Line3"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line2"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Address Line1"
						$_l_Next:=$_l_Next-1
						$2->{$_l_Next}:="Name"
					End if 
				: (Size of array:C274($2->)=8)
					$2->{$_l_Next}:="Address Line3"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Address Line2"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Address Line1"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Name"
					$_l_Next:=$_l_Next-1
					$2->{$_l_Next}:="Company"
				Else 
					$_bo_Exception:=True:C214
			End case 
		Else 
			//TRACE
			//ALERT($_t_Address)
	End case 
	//Gen_Alert ($_t_AddressOut)
	
End if 
For ($_l_Index; 1; Size of array:C274($2->))
	If ($2->{$_l_Index}="")
		$_bo_Exception:=True:C214
	End if 
	
	
End for 
If ($_bo_Exception)
	RR_t_AddressFieldData_1:=""
	RR_t_AddressFieldData_2:=""
	RR_t_AddressFieldData_3:=""
	RR_t_AddressFieldData_4:=""
	RR_t_AddressFieldData_5:=""
	RR_t_AddressFieldData_6:=""
	RR_t_AddressFieldData_7:=""
	RR_t_AddressFieldData_8:=""
	RR_t_AddressFieldData_9:=""
	ARRAY TEXT:C222(RR_at_AddressFIeldName_1; 9)
	ARRAY TEXT:C222(RR_at_AddressFIeldName_2; 9)
	ARRAY TEXT:C222(RR_at_AddressFIeldName_3; 9)
	ARRAY TEXT:C222(RR_at_AddressFIeldName_4; 9)
	ARRAY TEXT:C222(RR_at_AddressFIeldName_5; 9)
	ARRAY TEXT:C222(RR_at_AddressFIeldName_6; 9)
	ARRAY TEXT:C222(RR_at_AddressFIeldName_7; 9)
	ARRAY TEXT:C222(RR_at_AddressFIeldName_8; 9)
	ARRAY TEXT:C222(RR_at_AddressFIeldName_9; 9)
	RR_at_AddressFIeldName_1{1}:="Company"
	RR_at_AddressFIeldName_1{2}:="Name"
	RR_at_AddressFIeldName_1{3}:="Address Line1"
	RR_at_AddressFIeldName_1{4}:="Address Line2"
	RR_at_AddressFIeldName_1{5}:="City"
	RR_at_AddressFIeldName_1{6}:="Zip"
	RR_at_AddressFIeldName_1{7}:="State"
	RR_at_AddressFIeldName_1{8}:="Country"
	RR_at_AddressFIeldName_1{9}:="Unknown"
	COPY ARRAY:C226(RR_at_AddressFIeldName_1; RR_at_AddressFIeldName_2)
	COPY ARRAY:C226(RR_at_AddressFIeldName_1; RR_at_AddressFIeldName_3)
	COPY ARRAY:C226(RR_at_AddressFIeldName_1; RR_at_AddressFIeldName_4)
	COPY ARRAY:C226(RR_at_AddressFIeldName_1; RR_at_AddressFIeldName_5)
	COPY ARRAY:C226(RR_at_AddressFIeldName_1; RR_at_AddressFIeldName_6)
	COPY ARRAY:C226(RR_at_AddressFIeldName_1; RR_at_AddressFIeldName_7)
	COPY ARRAY:C226(RR_at_AddressFIeldName_1; RR_at_AddressFIeldName_8)
	COPY ARRAY:C226(RR_at_AddressFIeldName_1; RR_at_AddressFIeldName_9)
	RR_at_AddressFIeldName_1:=0
	RR_at_AddressFIeldName_2:=0
	RR_at_AddressFIeldName_3:=0
	RR_at_AddressFIeldName_4:=0
	RR_at_AddressFIeldName_5:=0
	RR_at_AddressFIeldName_6:=0
	RR_at_AddressFIeldName_7:=0
	RR_at_AddressFIeldName_8:=0
	RR_at_AddressFIeldName_9:=0
	//TRACE
	Gen_Alert("Reading an address from the website has resulted in an exception, please identify in the following window the correct fields for the address data, if this is a a format you think the system should understand submit the Address Details to Tim")
	For ($_l_Index; 1; Size of array:C274($2->))
		If ($_l_Index<9)
			$_bo_Append:=False:C215
			$_Ptr_AddressVar:=Get pointer:C304("RR_at_AddressFIeldName_"+String:C10($_l_Index))
		Else 
			$_bo_Append:=True:C214
			$_Ptr_AddressVar:=Get pointer:C304("RR_at_AddressFIeldName_"+String:C10(8))
		End if 
		$_l_AddressRow:=Find in array:C230($_Ptr_AddressVar->; $2->{$_l_Index})
		If ($_l_AddressRow>0)
			$_Ptr_AddressVar->:=$_l_AddressRow
		End if 
		$_Ptr_AddressVar2:=Get pointer:C304("RR_t_AddressFieldData_"+String:C10($_l_Index))
		If ($_bo_Append)
			$_Ptr_AddressVar2->:=$_Ptr_AddressVar2->+$3->{$_l_Index}
		Else 
			$_Ptr_AddressVar2->:=$3->{$_l_Index}
		End if 
	End for 
	RR_t_AddressBlock:=$_t_AddressWithCommas
	Open window:C153(20; 20; 20; 20; Alternate dialog box:K34:5)
	DIALOG:C40("ADDRESS_SETTER")
	CLOSE WINDOW:C154
	For ($_l_Index; 1; Size of array:C274($2->))
		$_Ptr_AddressVar:=Get pointer:C304("RR_at_AddressFIeldName_"+String:C10($_l_Index))
		$2->{$_l_Index}:=$_Ptr_AddressVar->{$_Ptr_AddressVar->}
		$_Ptr_AddressVar2:=Get pointer:C304("RR_t_AddressFieldData_"+String:C10($_l_Index))
		$3->{$_l_Index}:=$_Ptr_AddressVar2->
	End for 
	
End if 
ERR_MethodTrackerReturn("RR_ZenCartAddressDecode"; $_t_oldMethodName)