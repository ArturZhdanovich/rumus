<?php

require_once("scripter.php");
require_once("parsemx.php");

// Incoming data ------------
$wsources = array(); // Array of html sources

// Find substring that differs a bit
function substr_like($text,$source) {
    //xlog("Substr started");
    $match = array();
    $start=0;
    $end=0;
    $strs=array();
    while ($start<strlen($text)) {
        $end++;
        $found=false;
        while ((strpos($source,substr($text,$start,$end-$start))!==false) and ($end<=strlen($text))) {
            // Check the descendacy
            /*if ($match) {
                $good=false;
                foreach ($match as $m) {
                    $p=0;
                    while ( ($p=strpos($source,substr($text,$m[0],$m[1]-$m[0]),$p))!==false ) {
                        $p2=0; $pe=$p+$m[1]-$m[0];
                        while ( ($p2=strpos($source,substr($text,$start,$end-$start),$p2))!==false ) {
                            if (($p2>$pe) and ($p2-$pe<500)) {$good=true; break;
                                //xlog("Good:".substr($text,$start,$end-$start));
                            }
                            $p2++;
                        }
                        if ($good) break;
                        $p++;
                    }
                    if ($good) break;
                }
                if (!$good) break;
            }*/
            $found=true; $end++;
        }
        if ($found) {
            // ----- Descendacy check2 --------
            $good=false;
            $token = substr($text,$start,$end-$start-1);
            //xlog("Checking ".$token);
            if (strlen($token)>2)
            foreach ($strs as $str) {
                $sp = $str[0]+$str[1];
                $p=strpos($source,$token,$sp);
                if (($p!==false) and ($p-$sp<500)) {$good=true; break;}
            }
            if (!$strs)
                $good=true;
            /*$n=0;$p=0;
            while ( ($p=strpos($source,substr($text,$start,$end-$start-1),$p))!==false ) { $n++;$p++;}
            */
            $p=0;
            $i=count($strs);
            $added=false;
            if ($good)
                while ( ($p=strpos($source,$token,$p))!==false ) {
                    $good = false;
                    foreach ($strs as $str) {
                        $sp = $str[0]+$str[1];
                        //xlog($sp." and ".$p);
                        if (($p>=$sp) and ($p-$sp<500)) {$good=true; break;}
                    }
                    if (!$strs) $good=true;
                    if ($good) {
                    //xlog("Adding ".$token." pos ".$p);
                    $added=true;
                    $strs[]=array($p,strlen($token),0,$i); // pos,len,score,number
                    }
                    $p++;
                }
            if ($added) if ($end==strlen($text)+1) break; //tail found
        }
        while ((strpos($source,substr($text,$start,$end-$start))===false) and ($start<$end)) $start++;
        if ($end>=strlen($text)) $end=strlen($text)-2;
        $start++;
        if ($end<$start) $end=$start;
        //xlog("Start: $start End: $end");
    }
    if (!$strs) return "";
    //xlog("Like results:");
    /*foreach ($match as $i=>$m) {
        $s=substr($text,$m[0],$m[1]-$m[0]);
        //xlog($s.' - pos '.strpos($source,$s).', len '.($m[1]-$m[0]));
        $p=0;
        while ( ($p=strpos($source,$s,$p))!==false ) {
            xlog("Adding ".$s." pos ".$p);
            $strs[]=array($p,strlen($s),0,$i); // pos,len,score,number
            $p++;
        }
    }*/
    //xlog("Scoring");
    // Score all the strings
    $work=true;
    while ($work) {
        $work=false;
        foreach ($strs as &$str)
            if (!$str[2]) {
                $max=0;
                foreach ($strs as $str2)
                    if (($str2[0]>=$str[0]+$str[1]) and ($str2[3]>$str[3])) {
                        if (!$str2[2]) {$max=-1; break;}
                        if ($str2[2]>$max) $max=$str2[2];
                    }
                if ($max==-1) continue;
                $str[2]=$max+$str[1];
                $work=true;
            }
    }
    //xlog("Building result");
    // Find the max-scored string
    $p=0;$work=true;$curn=-1;
    while ($work) {
        $work=false;
        $max=0;$maxi=0;
        foreach ($strs as $i=>$st)
            if (($st[0]+$st[1]>=$p) and ($st[3]>$curn) and ($st[2]>$max)) {$max=$st[2]; $maxi=$i;
                //xlog("Max: ".substr($source,$strs[$maxi][0],$strs[$maxi][1])." pos ".$strs[$maxi][0]. " score ".$strs[$maxi][2]);
            }
        if ($max) {
            $work=true;
            //xlog("Substring: ".substr($source,$strs[$maxi][0],$strs[$maxi][1])." pos ".$strs[$maxi][0]. " score ".$strs[$maxi][2]);
            if (!$p) $start=$strs[$maxi][0];
            $p=$strs[$maxi][0]+$strs[$maxi][1];
            $curn=$strs[$maxi][3];
        }
    }
    //xlog("Done");
    return substr($source,$start,$p-$start);
}


// Check if result is valid

function nosp($text) {
    return str_replace(" ","",trim(strtoupper($text)));
}

function CheckResult($text,$res) {
    foreach ($text as $i=>$txt) {
        if ($txt[0]) if (nosp($txt[0])!=nosp($res[$i][0])) return false;
        if (@$txt[1]) if (nosp($txt[1])!=nosp(end($res[$i]))) return false;
    }
    return true;
}

// Find zone, where simple solution exists
function FindZone(&$text,$zones) {
    //Leave only 1 zone
    //$zones=array($zones[0]);
    //-----------------
    $start_time = microtime(true);
    global $wsources,$res;
    foreach ($zones as $z=>$zone) {
        $right[$z] = $zone[1];
        $right2[$z] = $right[$z];
        $state[$z] = 1; // 1 - looking for left, 2 - for right, 0 - failed
        $gopeners[$z] = insides('<','>',substr($wsources[0],0,$zone[0]));
        $gopeners[$z] = insidesx('"','"',$gopeners[$z]);
        $lefto[$z] = count($gopeners[$z]);
    }

    $end=false;
    while (!$end) { $end = true;

        if (microtime(true)-$start_time>10) return false;

    foreach ($zones as $z=>$zone) {

        if (($lefto[$z]<=0) or ($right2[$z]>=strlen($wsources[0]))) $state[$z]=0;

        //xlog($state[$z]);

        if ($state[$z]==1) { // Look for zone opener
            $lefto[$z]--;
            $good = false;
                $end = false;
                $opener = $gopeners[$z][$lefto[$z]];
                // Opener check
                //xlog("Checking opener: ".$opener);
                $good = true;
                foreach ($wsources as $i=>$source) {
                    $p = strpos($source,$opener);
                    if ($p===false) {$good=false; break; }
                    $p+=strlen($opener);
                    $left2[$z]=$p;
                    if ($text[$i][0]) {
                        $t1 = strpos($source,$text[$i][0],$p);
                        if (!$t1) {$good=false; break;}
                        if (@$text[$i][1]) {
                            $t2 = strpos($source,$text[$i][1],$p);
                            if (!$t2 or ($t2<$t1)) {$good=false; break;}
                        }
                    }
                }
                if ($good) { // Opener found
                    //xlog("Opener found");
                    $openers[$z]=$opener;
                    $left2[$z]=strpos($wsources[0],$opener)+strlen($opener);
                    $right2[$z] = $right[$z];
                    $state[$z]=2;
                }
        }

        if ($state[$z]==2) { // Look for zone closer
            $right2[$z]++;

            $good = false;
            for($l=1;$l<=$right2[$z]-$right[$z];$l++) {
                $end = false;
                $closer = substr($wsources[0],$right2[$z]-$l,$l);
                //xlog("Z$z: $closer");
                $utf=false;
                for($i=0;$i<strlen($closer);$i++)
                    if (ord($closer[$i])>127) $utf=true;
                if ($utf or ($l>16)) break;

                if (strpos($wsources[0],$closer,$left2[$z])!==$right2[$z]-$l) continue; // Closer doesn't leads to this position
                // Closer check
                //xlog("Checking closer: ".$closer);
                $good = true;
                foreach ($wsources as $i=>$source) {
                    $p = strpos($source,$openers[$z])+strlen($openers[$z]);
                    $p2 = strpos($source,$closer,$p);
                    if ($p2===false) {$good=false; break; }
                        if ($text[$i][0]) {
                            $t1 = strpos($source,$text[$i][0],$p);
                            if ($t1+strlen($text[$i][0])>=$p2) {$good=false; break;}
                            if (@$text[$i][1]) {
                                $t2 = strpos($source,$text[$i][1],$p);
                                if ($t2+strlen($text[$i][1])>=$p2 or ($t2<$t1)) {$good=false; break;}
                            }
                        }
                }
                if ($good) { // Closer found
                    //xlog("Closer found");
                    // Check the final result
                    $source = inside($openers[$z],$closer,$wsources[0]);
                    $ins = wz_find_inside($source,strpos($source,@$text[0][0]),strlen(@$text[0][0]),@$text[0][1],$text);
                    if ($ins=='nocloser') $ins=false;
                    if ($ins) {
                        // Build result
                        $res = array();
                        foreach ($wsources as $i=>$source)
                            $res[$i] = insides($ins[0],$ins[1],inside($openers[$z],$closer,$source));
                        if (CheckResult($text,$res)) {
                            $result = 'inside "'.str_replace('"','""',$openers[$z]).'", "'.str_replace('"','""',$closer).'" -> ';
                            $result .= 'inside "'.str_replace('"','""',$ins[0]).'", "'.str_replace('"','""',$ins[1]).'"';
                            return $result;
                        }
                    }
                    $state[$z]=1;
                    break;
                }
            }
        }

    }
    }
    //xlog("Zones failed.");
    return false;

}


// Find common beginning text that is missing at sources
function FindIntro(&$text) {
    global $wsources;
    $p=1;
    $margin = (int)(strlen($text[0][0])*2/3);
    while ($p<$margin) {
        // Check if tail works
        $good = true;
        foreach ($wsources as $i=>$source)
            foreach ($text[$i] as &$txt)
                if ($txt) {
                if (substr($txt,0,$p)!=substr($text[0][0],0,$p)) return false; // Tail mismatch
                if (strpos($source,substr($txt,$p))===false) {
                    $good = false;
                    break;
                }
            }
        if ($good) { // Found working tail
            $tail = substr($text[0][0],0,$p);
            foreach ($text as $i=>$texts)
                foreach ($text[$i] as &$txt)
                if ($txt) $txt = substr($txt,$p);
            return $tail;
        }
        $p++;
    }
    return false; // Not found in sources
}

function wz_find_text(&$text) { // Text is arrays of texts for each source
    global $wsources,$res;
    // Check all sources contain $text
    $good = true;
    foreach ($wsources as $i=>$source)
        foreach ($text[$i] as $txt)
        if ($txt)
        if (strpos($source,$txt)===false) {
            $good = false;
            break;
        }
    $intro='';
    if (!$good) {
        $intro = FindIntro($text);
        if (!$intro) { // Intro not found too
            foreach ($wsources as $i=>$source)
                foreach ($text[$i] as &$txt)
                if ($txt)
                    if (strpos($source,$txt)===false) $txt = '**';
            return "FAILED: Source doesn't contain target text";
        }
    }

    // Roll tru all entries on first source
    $p = 0;
    $result=false;
    $closer=false;
    while ( ($p=strpos($wsources[0],$text[0][0],$p))!==false ) {

        // Try simple solution
        @$ins = wz_find_inside($wsources[0],$p,strlen($text[0][0]),$text[0][1],$text);
        if ($ins=="nocloser") $ins=false; else $closer=true;
        if ($ins) {
            // Build result
            $res = array();
            foreach ($wsources as $i=>$source)
                $res[$i] = insides($ins[0],$ins[1],$source);
            if (CheckResult($text,$res)) {
                 $result = 'inside "'.str_replace('"','""',$ins[0]).'", "'.str_replace('"','""',$ins[1]).'"';
                 break;
            }
        }
        $p++;
    }

    if (!$closer) xlog("Closer not found, aborting.");

    if (!$result and $closer) {
        // Go for zones solution
        $zones=array();
        // Build starting zones
        $p = 0;
        $first = $text[0][0];
        $last = @$text[0][1];
        if (!$last) $last=$first;
        while ( ($p=strpos($wsources[0],$first,$p))!==false ) {
            $p2=$p;
            while ( ($p2=strpos($wsources[0],$last,$p2))!==false ) {
                $zone[0]=$p; $zone[1]=$p2+strlen($last);
                $zones[]=$zone;
                if ($first==$last) break;
                $p2++;
            }
            $p++;
        }
        //xlog("Zones: ".count($zones));
        if ($zones) $result = FindZone($text,$zones);
    }

    if ($result) {
        // Feed results
        foreach ($wsources as $i=>$source) {
            if (!$text[$i][0]) $text[$i][0] = $res[$i][0];
            $text[$i][0] = $intro.$text[$i][0];
            if (@!$text[$i][1]) $text[$i][1] = end($res[$i]);
            $text[$i][1] = $intro.$text[$i][1];
            $text[$i][2] = $res[$i];
            foreach ($text[$i][2] as &$r) $r=$intro.$r;
        }

        if ($intro) $result = '"'.$intro.'" + '.$result;
        return $result;
    }

    return false;
}

// ParseMX WIZARD code
function wz_find_inside($source,$pos,$len,$last,$text) {
    global $wsources;
    // Target string
    $target = substr($source,$pos,$len);
    // Find closer
    $closer='';
    $p = $pos+$len;
    $good = true;
    while ($p<strlen($source)) {
        if (ord($source[$p])>127) // UTF8 Work
            $closer.=substr($source,$p++,2);
        else $closer.=$source[$p];
      $p++;
      // Check if all supplied text are missing this piece
      $good = true;
      foreach ($text as $txt) foreach ($txt as $line)
          if (strpos($line,$closer)!==false) { $good = false; break; }

      // Check if all supplied text are closed with this closer
      $failed = false;
      if ($good)
        foreach ($wsources as $i=>$xsource) foreach ($text[$i] as $txt)
            if ($txt)
            if (strpos($xsource,$txt.$closer)===false) { $failed = true; break; }
      if ($failed) {$good=false; break;}
      if ($good) break;
    }
    if ($closer && !$good) return "nocloser";
    // Find opener
    $opener = '';
    $p = $pos-1;
    while ($p>=0) {
        if (ord($source[$p])>127) // UTF8 Work
            $opener = substr($source,--$p,2).$opener;
        else $opener = $source[$p].$opener;
        $p--;
        $good = true;
        if (strpos($source,$opener)!==$pos-strlen($opener)) $good=false;
        if ($good and $last) {
            $res = insides($opener,$closer,$source);
            if (end($res)!=$last) {
                $good=false;
                $contains=false;
                foreach ($res as $line)
                    if (strpos($line,$last)!==false) {$contains=true; break;}
                if (!$contains) break;
                //if (!in_array($last,$res)) break;
            }
        }
        if ($good) break;
    }
    if ($opener && !$good) return false;
    return array($opener,$closer);
}

/*
// ----- Test chamber -----
header('Content-Type: text/html; charset=utf-8');

$urls = array('http://rozetka.com.ua/samsung_galaxy_note_N7100_titan_gray/p237364/',
'http://rozetka.com.ua/samsung_c_3782_onyx_black/p215142/');

for($i=0;$i<9;$i++)
    if (file_exists($i)) $wsources[$i]=file_get_contents($i);
else if (isset($urls[$i])) {
    $wsources[$i] = get($urls[$i]);
    file_put_contents($i,$wsources[$i]);
}

$text = array('6 008','697');
$result = wz_find_text($text);
if (!$result) echo "false"; else echo $result;
*/