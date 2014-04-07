<?php
ob_end_clean();
require_once('tcpdf/tcpdf.php');
class MYPDF extends TCPDF {
        public function Header() {
            $bMargin = $this->getBreakMargin();
            $auto_page_break = $this->AutoPageBreak;
            $this->SetAutoPageBreak(false, 0);
            $image_file = 'ps_112.JPG';
            $this->Image($image_file, 5, 10, 200, 100, 'JPG', '', '', false, 300, '',  false, false, 0);
            $this->SetAutoPageBreak($auto_page_break, $bMargin);
            $this->setPageMark();
        }
    }
$pdf = new MYPDF ('P', 'mm', 'A4', true, 'UTF-8', false);
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor('Artur');
$pdf->SetTitle('ps_112');
$pdf->SetSubject('ps_112');
$pdf->SetKeywords('ps_112');
$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));
$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);
$pdf->setLanguageArray($l);
$pdf->setFontSubsetting(true);
$pdf->SetFont('dejavusans', '', 10, '', true);
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);
$pdf->AddPage();


// выводи header в котором будет устанавливаться фоновая картинка.
// т.к. шапка ставится везде - бг будет на каждой странице.
    $pdf->setPrintHeader(true);
    $pdf->setPrintFooter(false);

$pdf->SetXY(0, 0);
//Cell($w, $h=0, $txt='', $border=0, $ln=0, $align='', $fill=0, $link='', $stretch=0, $ignore_min_height=false, $calign='T', $valign='M')
$text=num2str($_POST["order_price"]);
$pdf->Cell(40, 70,$_POST["order_price"], 0, 0, 'C', false, '', 0, false, 'T', 'M');
$pdf->SetXY(0, 0);
$pdf->Cell(185, 70,$text, 0, 0, 'C', false, '', 0, false, 'T', 'M');
$pdf->SetXY(0, 0);
$pdf->Cell(150, 90,$_POST["from_name"], 0, 0, 'C', false, '', 0, false, 'T', 'M');
$pdf->SetXY(0, 0);
$pdf->Cell(150, 115, $_POST["from_address_1"], 0, 0, 'C', false, '', 0, false, 'T', 'M');
$pdf->SetXY(0, 0);
$pdf->Cell(55, 115, $_POST["from_zip"], 0, 0, 'C', false, '', 0, false, 'T', 'M');
$pdf->SetXY(0, 0);
$pdf->Cell(150, 140,$_POST["to_name"], 0, 0, 'C', false, '', 0, false, 'T', 'M');
$pdf->SetXY(0, 0);
$pdf->Cell(55, 155,$_POST["to_zip"], 0, 0, 'C', false, '', 0, false, 'T', 'M');
$pdf->SetXY(0, 0);
$pdf->Cell(160, 155,$_POST["to_address_2"], 0, 0, 'C', false, '', 0, false, 'T', 'M');
$pdf->SetXY(0, 0);
$pdf->Cell(140, 170,$_POST["to_address_1"], 0, 0, 'C', false, '', 0, false, 'T', 'M');
$pdf->SetXY(0, 0);
$pdf->Output('example_009.pdf', 'I');



function num2str($num) {
    $nul='ноль';
    $ten=array(
        array('','один','два','три','четыре','пять','шесть','семь', 'восемь','девять'),
        array('','одна','две','три','четыре','пять','шесть','семь', 'восемь','девять'),
    );
    $a20=array('десять','одиннадцать','двенадцать','тринадцать','четырнадцать' ,'пятнадцать','шестнадцать','семнадцать','восемнадцать','девятнадцать');
    $tens=array(2=>'двадцать','тридцать','сорок','пятьдесят','шестьдесят','семьдесят' ,'восемьдесят','девяносто');
    $hundred=array('','сто','двести','триста','четыреста','пятьсот','шестьсот', 'семьсот','восемьсот','девятьсот');
    $unit=array( // Units
        array('копейка' ,'копейки' ,'копеек',	 1),
        array('рубль'   ,'рубля'   ,'рублей'    ,0),
        array('тысяча'  ,'тысячи'  ,'тысяч'     ,1),
        array('миллион' ,'миллиона','миллионов' ,0),
        array('миллиард','милиарда','миллиардов',0),
    );
    list($rub,$kop) = explode('.',sprintf("%015.2f", floatval($num)));
    $out = array();
    if (intval($rub)>0) {
        foreach(str_split($rub,3) as $uk=>$v) { // by 3 symbols
            if (!intval($v)) continue;
            $uk = sizeof($unit)-$uk-1; // unit key
            $gender = $unit[$uk][3];
            list($i1,$i2,$i3) = array_map('intval',str_split($v,1));
            // mega-logic
            $out[] = $hundred[$i1]; # 1xx-9xx
            if ($i2>1) $out[]= $tens[$i2].' '.$ten[$gender][$i3]; # 20-99
            else $out[]= $i2>0 ? $a20[$i3] : $ten[$gender][$i3]; # 10-19 | 1-9
            // units without rub & kop
            if ($uk>1) $out[]= morph($v,$unit[$uk][0],$unit[$uk][1],$unit[$uk][2]);
        } //foreach
    }
    else $out[] = $nul;
    $out[] = morph(intval($rub), $unit[1][0],$unit[1][1],$unit[1][2]); // rub
    return trim(preg_replace('/ {2,}/', ' ', join(' ',$out)));
}
function morph($n, $f1, $f2, $f5) {
    $n = abs(intval($n)) % 100;
    if ($n>10 && $n<20) return $f5;
    $n = $n % 10;
    if ($n>1 && $n<5) return $f2;
    if ($n==1) return $f1;
    return $f5;
}
?>
