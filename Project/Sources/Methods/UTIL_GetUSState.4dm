//%attributes = {}

If (False:C215)
	//Project Method Name:      UTIL_GetUSState
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  16/06/2020
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	//C_UNKNOWN($0)
	ARRAY TEXT:C222($_at_AltStateCodes; 0)
	ARRAY TEXT:C222($_at_OtherMIssspellings; 0)
	ARRAY TEXT:C222($_at_ResolveTo; 0)
	ARRAY TEXT:C222($_at_StateCodes; 0)
	ARRAY TEXT:C222($_at_StateNames; 0)
	C_LONGINT:C283($_l_Ref)
	C_TEXT:C284($_t_InputState; $1)
End if 
//Code Starts Here
If (Count parameters:C259>=1)
	$_t_InputState:=$1
	
	If ($_t_InputState#"")
		
		ARRAY TEXT:C222($_at_StateNames; 62)
		ARRAY TEXT:C222($_at_StateCodes; 62)
		
		$_at_StateCodes{1}:="AZ"
		$_at_StateCodes{2}:="CA"
		$_at_StateCodes{3}:="CO"
		$_at_StateCodes{4}:="CT"
		$_at_StateCodes{5}:="DC"
		$_at_StateCodes{6}:="DE"
		$_at_StateCodes{7}:="FL"
		$_at_StateCodes{8}:="FM"
		$_at_StateCodes{9}:="GA"
		$_at_StateCodes{10}:="GU"
		$_at_StateCodes{11}:="HI"
		$_at_StateCodes{12}:="IA"
		$_at_StateCodes{13}:="ID"
		$_at_StateCodes{14}:="IL"
		$_at_StateCodes{15}:="IN"
		$_at_StateCodes{16}:="KS"
		$_at_StateCodes{17}:="KY"
		$_at_StateCodes{18}:="LA"
		$_at_StateCodes{19}:="MA"
		$_at_StateCodes{20}:="MD"
		$_at_StateCodes{21}:="ME"
		$_at_StateCodes{22}:="MH"
		$_at_StateCodes{23}:="MI"
		$_at_StateCodes{24}:="MN"
		$_at_StateCodes{25}:="MO"
		$_at_StateCodes{26}:="MP"
		$_at_StateCodes{27}:="MS"
		$_at_StateCodes{28}:="MT"
		$_at_StateCodes{29}:="NC"
		$_at_StateCodes{30}:="ND"
		$_at_StateCodes{31}:="NE"
		$_at_StateCodes{32}:="NH"
		$_at_StateCodes{33}:="NJ"
		$_at_StateCodes{34}:="NM"
		$_at_StateCodes{35}:="NV"
		$_at_StateCodes{36}:="NY"
		$_at_StateCodes{37}:="OH"
		$_at_StateCodes{38}:="OK"
		$_at_StateCodes{39}:="OR"
		$_at_StateCodes{40}:="PA"
		$_at_StateCodes{41}:="PR"
		$_at_StateCodes{42}:="PW"
		$_at_StateCodes{43}:="RI"
		$_at_StateCodes{44}:="SC"
		$_at_StateCodes{45}:="SD"
		$_at_StateCodes{46}:="TN"
		$_at_StateCodes{47}:="TX"
		$_at_StateCodes{48}:="UT"
		$_at_StateCodes{49}:="VA"
		$_at_StateCodes{50}:="VI"
		$_at_StateCodes{51}:="VT"
		$_at_StateCodes{52}:="WA"
		$_at_StateCodes{53}:="WI"
		$_at_StateCodes{54}:="WV"
		$_at_StateCodes{55}:="WY"
		$_at_StateCodes{56}:="AA"
		$_at_StateCodes{57}:="AE"
		$_at_StateCodes{58}:="AK"
		$_at_StateCodes{59}:="AL"
		$_at_StateCodes{60}:="AP"
		$_at_StateCodes{61}:="AR"
		$_at_StateCodes{62}:="AS"
		
		APPEND TO ARRAY:C911($_at_StateCodes; "MASS")
		APPEND TO ARRAY:C911($_at_StateCodes; "WASH")
		APPEND TO ARRAY:C911($_at_StateCodes; "WISC")
		APPEND TO ARRAY:C911($_at_StateCodes; "MICH")
		$_at_StateNames{1}:="Arizona"
		$_at_StateNames{2}:="California"
		$_at_StateNames{3}:="Colorado"
		$_at_StateNames{4}:="Connecticut"
		$_at_StateNames{5}:="District of Columbia"
		$_at_StateNames{6}:="Delaware"
		$_at_StateNames{7}:="Florida"
		$_at_StateNames{8}:="Federated states of Micronesia"
		$_at_StateNames{9}:="Georgia"
		$_at_StateNames{10}:="Guam"
		$_at_StateNames{11}:="Hawaii"
		$_at_StateNames{12}:="Iowa"
		$_at_StateNames{13}:="Idaho"
		$_at_StateNames{14}:="Illinois"
		$_at_StateNames{15}:="Indiana"
		$_at_StateNames{16}:="Kansas"
		$_at_StateNames{17}:="Kentucky"
		$_at_StateNames{18}:="Louisiana"
		$_at_StateNames{19}:="Massachusetts"
		$_at_StateNames{20}:="Maryland"
		$_at_StateNames{21}:="Maine"
		$_at_StateNames{22}:="Marshall Islands"
		$_at_StateNames{23}:="Michigan"
		$_at_StateNames{24}:="Minnesota"
		$_at_StateNames{25}:="Missouri"
		$_at_StateNames{26}:="Northern Mariana Islands"
		$_at_StateNames{27}:="Mississippi"
		$_at_StateNames{28}:="Montana"
		$_at_StateNames{29}:="North Carolina"
		$_at_StateNames{30}:="North Dakota"
		$_at_StateNames{31}:="Nebraska"
		$_at_StateNames{32}:="New Hampshire"
		$_at_StateNames{33}:="New Jersey"
		$_at_StateNames{34}:="New Mexico"
		$_at_StateNames{35}:="Nevada"
		$_at_StateNames{36}:="New York"
		$_at_StateNames{37}:="Ohio"
		$_at_StateNames{38}:="Oklahoma"
		$_at_StateNames{39}:="Oregon"
		$_at_StateNames{40}:="Pennsylvania"
		$_at_StateNames{41}:="Puerto Rico"
		$_at_StateNames{42}:="Palau"
		$_at_StateNames{43}:="Rhode Island"
		$_at_StateNames{44}:="South Carolina"
		$_at_StateNames{45}:="South Dakota"
		$_at_StateNames{46}:="Tennessee"
		$_at_StateNames{47}:="Texas"
		$_at_StateNames{48}:="Utah"
		$_at_StateNames{49}:="Virginia"
		$_at_StateNames{50}:="Virgin Islands"
		$_at_StateNames{51}:="Vermont"
		$_at_StateNames{52}:="Washington"
		$_at_StateNames{53}:="Wisconsin"
		$_at_StateNames{54}:="West Virginia"
		$_at_StateNames{55}:="Wyoming"
		$_at_StateNames{56}:="Armed Forces-Europe/Africa/Canada"
		$_at_StateNames{57}:="Armed Forces-Europe/Africa/Canada"
		$_at_StateNames{58}:="Alaska"
		$_at_StateNames{59}:="Alabama"
		$_at_StateNames{60}:="Armed Forces-Pacific"
		$_at_StateNames{61}:="Arkansas"
		$_at_StateNames{62}:="American Samoa"
		APPEND TO ARRAY:C911($_at_StateNames; "Massachusetts")
		APPEND TO ARRAY:C911($_at_StateNames; "Washington")
		APPEND TO ARRAY:C911($_at_StateNames; "Wisconsin")
		APPEND TO ARRAY:C911($_at_StateNames; "Michigan")
		ARRAY TEXT:C222($_at_AltStateCodes; 62)
		$_at_AltStateCodes{1}:="A Z"
		$_at_AltStateCodes{2}:="C A"
		$_at_AltStateCodes{3}:="C O"
		$_at_AltStateCodes{4}:="C T"
		$_at_AltStateCodes{5}:="D C"
		$_at_AltStateCodes{6}:="D E"
		$_at_AltStateCodes{7}:="F L"
		$_at_AltStateCodes{8}:="F M"
		$_at_AltStateCodes{9}:="G A"
		$_at_AltStateCodes{10}:="G U"
		$_at_AltStateCodes{11}:="H I"
		$_at_AltStateCodes{12}:="I A"
		$_at_AltStateCodes{13}:="I D"
		$_at_AltStateCodes{14}:="I L"
		$_at_AltStateCodes{15}:="I N"
		$_at_AltStateCodes{16}:="K S"
		$_at_AltStateCodes{17}:="K Y"
		$_at_AltStateCodes{18}:="L A"
		$_at_AltStateCodes{19}:="M A"
		$_at_AltStateCodes{20}:="M D"
		$_at_AltStateCodes{21}:="M E"
		$_at_AltStateCodes{22}:="M H"
		$_at_AltStateCodes{23}:="M I"
		$_at_AltStateCodes{24}:="M N"
		$_at_AltStateCodes{25}:="M O"
		$_at_AltStateCodes{26}:="M P"
		$_at_AltStateCodes{27}:="M S"
		$_at_AltStateCodes{28}:="M T"
		$_at_AltStateCodes{29}:="N C"
		$_at_AltStateCodes{30}:="N D"
		$_at_AltStateCodes{31}:="N E"
		$_at_AltStateCodes{32}:="N H"
		$_at_AltStateCodes{33}:="N J"
		$_at_AltStateCodes{34}:="N M"
		$_at_AltStateCodes{35}:="N V"
		$_at_AltStateCodes{36}:="N Y"
		$_at_AltStateCodes{37}:="O H"
		$_at_AltStateCodes{38}:="O K"
		$_at_AltStateCodes{39}:="O R"
		$_at_AltStateCodes{40}:="P A"
		$_at_AltStateCodes{41}:="P R"
		$_at_AltStateCodes{42}:="P W"
		$_at_AltStateCodes{43}:="R I"
		$_at_AltStateCodes{44}:="S C"
		$_at_AltStateCodes{45}:="S D"
		$_at_AltStateCodes{46}:="T N"
		$_at_AltStateCodes{47}:="T X"
		$_at_AltStateCodes{48}:="U T"
		$_at_AltStateCodes{49}:="V A"
		$_at_AltStateCodes{50}:="V I"
		$_at_AltStateCodes{51}:="V T"
		$_at_AltStateCodes{52}:="W A"
		$_at_AltStateCodes{53}:="W I"
		$_at_AltStateCodes{54}:="W V"
		$_at_AltStateCodes{55}:=" WY"
		$_at_AltStateCodes{56}:="A A"
		$_at_AltStateCodes{57}:="A E"
		$_at_AltStateCodes{58}:="A K"
		$_at_AltStateCodes{59}:="A L"
		$_at_AltStateCodes{60}:="A P"
		$_at_AltStateCodes{61}:="A R"
		$_at_AltStateCodes{62}:="A S"
		ARRAY TEXT:C222($_at_OtherMIssspellings; 0)
		ARRAY TEXT:C222($_at_ResolveTo; 0)
		APPEND TO ARRAY:C911($_at_OtherMIssspellings; "Ill")
		APPEND TO ARRAY:C911($_at_ResolveTo; "Il")
		////1l L
		APPEND TO ARRAY:C911($_at_OtherMIssspellings; "1l L")
		APPEND TO ARRAY:C911($_at_ResolveTo; "Il")
		
		APPEND TO ARRAY:C911($_at_OtherMIssspellings; "N.J")
		APPEND TO ARRAY:C911($_at_ResolveTo; "NJ")
		APPEND TO ARRAY:C911($_at_OtherMIssspellings; "N.Y")
		APPEND TO ARRAY:C911($_at_ResolveTo; "NY")
		$_l_Ref:=Find in array:C230($_at_OtherMIssspellings; $_t_InputState)
		If ($_l_ref>0)
			$_t_InputState:=$_at_ResolveTo{$_l_ref}
		End if 
		
		$_L_Ref:=Find in array:C230($_at_StateNames; $_t_InputState)
		$0:=""
		If ($_L_Ref>0)
			$0:=$_at_StateCodes{$_L_Ref}
		Else 
			$_L_Ref:=Find in array:C230($_at_StateCodes; $_t_InputState)
			If ($_L_Ref>0)
				$0:=$_at_StateNames{$_L_Ref}
			Else 
				$_L_Ref:=Find in array:C230($_at_AltStateCodes; $_t_InputState)
				If ($_L_Ref>0)
					$0:=$_at_StateNames{$_L_Ref}
				End if 
			End if 
		End if 
	End if 
	
End if 
