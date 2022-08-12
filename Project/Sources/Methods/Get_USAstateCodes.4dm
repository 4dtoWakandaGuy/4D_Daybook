//%attributes = {}
If (False:C215)
	//Project Method Name:      Get_USAstateCodes
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:       29/01/2011 11:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_StateCode; 0)
	ARRAY TEXT:C222($_at_StateNames; 0)
	C_LONGINT:C283($_l_StateRow)
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Get_USAstateCodes")
ARRAY TEXT:C222($_at_StateNames; 62)
ARRAY TEXT:C222($_at_StateCode; 62)

$_at_StateCode{1}:="AZ"
$_at_StateCode{2}:="CA"
$_at_StateCode{3}:="CO"
$_at_StateCode{4}:="CT"
$_at_StateCode{5}:="DC"
$_at_StateCode{6}:="DE"
$_at_StateCode{7}:="FL"
$_at_StateCode{8}:="FM"
$_at_StateCode{9}:="GA"
$_at_StateCode{10}:="GU"
$_at_StateCode{11}:="HI"
$_at_StateCode{12}:="IA"
$_at_StateCode{13}:="ID"
$_at_StateCode{14}:="IL"
$_at_StateCode{15}:="IN"
$_at_StateCode{16}:="KS"
$_at_StateCode{17}:="KY"
$_at_StateCode{18}:="LA"
$_at_StateCode{19}:="MA"
$_at_StateCode{20}:="MD"
$_at_StateCode{21}:="ME"
$_at_StateCode{22}:="MH"
$_at_StateCode{23}:="MI"
$_at_StateCode{24}:="MN"
$_at_StateCode{25}:="MO"
$_at_StateCode{26}:="MP"
$_at_StateCode{27}:="MS"
$_at_StateCode{28}:="MT"
$_at_StateCode{29}:="NC"
$_at_StateCode{30}:="ND"
$_at_StateCode{31}:="NE"
$_at_StateCode{32}:="NH"
$_at_StateCode{33}:="NJ"
$_at_StateCode{34}:="NM"
$_at_StateCode{35}:="NV"
$_at_StateCode{36}:="NY"
$_at_StateCode{37}:="OH"
$_at_StateCode{38}:="OK"
$_at_StateCode{39}:="OR"
$_at_StateCode{40}:="PA"
$_at_StateCode{41}:="PR"
$_at_StateCode{42}:="PW"
$_at_StateCode{43}:="RI"
$_at_StateCode{44}:="SC"
$_at_StateCode{45}:="SD"
$_at_StateCode{46}:="TN"
$_at_StateCode{47}:="TX"
$_at_StateCode{48}:="UT"
$_at_StateCode{49}:="VA"
$_at_StateCode{50}:="VI"
$_at_StateCode{51}:="VT"
$_at_StateCode{52}:="WA"
$_at_StateCode{53}:="WI"
$_at_StateCode{54}:="WV"
$_at_StateCode{55}:="WY"
$_at_StateCode{56}:="AA"
$_at_StateCode{57}:="AE"
$_at_StateCode{58}:="AK"
$_at_StateCode{59}:="AL"
$_at_StateCode{60}:="AP"
$_at_StateCode{61}:="AR"
$_at_StateCode{62}:="AS"
$_at_StateNames{1}:="Arizona"
$_at_StateNames{2}:="California"
$_at_StateNames{3}:="Colorado"
$_at_StateNames{4}:="Connecticut"
$_at_StateNames{5}:="District of Columbia"
$_at_StateNames{6}:="Delaware"
$_at_StateNames{7}:="Florida"
$_at_StateNames{8}:=""
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
$_at_StateNames{22}:=""
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
If (Count parameters:C259>=1)
	$0:=""
	$_l_StateRow:=Find in array:C230($_at_StateNames; $1)
	If ($_l_StateRow>0)
		$0:=$_at_StateCode{$_l_StateRow}
	Else 
		$_l_StateRow:=Find in array:C230($_at_StateCode; $1)
		If ($_l_StateRow>0)
			$0:=$_at_StateNames{$_l_StateRow}
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("GEt_USAstateCodes"; $_t_oldMethodName)