<?php
class ControllerModuleTableSize extends Controller {
	protected function index() {
		$this->language->load('module/table_size');
		
      	$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['text_select_size_table'] = $this->language->get('text_select_size_table');
		$this->data['text_clothing_sizes_woman'] = $this->language->get('text_clothing_sizes_woman');
		$this->data['text_clothing_sizes_woman_example'] = $this->language->get('text_clothing_sizes_woman_example');
		$this->data['text_clothing_size_info'] = $this->language->get('text_clothing_size_info');
		$this->data['text_euro_size'] = $this->language->get('text_euro_size');
		$this->data['text_rus_size'] = $this->language->get('text_rus_size');
		$this->data['text_og'] = $this->language->get('text_og');
		$this->data['text_ot'] = $this->language->get('text_ot');
		$this->data['text_ob'] = $this->language->get('text_ob');
		$this->data['text_lingerie_size'] = $this->language->get('text_lingerie_size');
		$this->data['text_opg'] = $this->language->get('text_opg');
		$this->data['text_size_chash'] = $this->language->get('text_size_chash');
		$this->data['text_gloves_sizes'] = $this->language->get('text_gloves_sizes');
		$this->data['text_size_dym'] = $this->language->get('text_size_dym');
		$this->data['text_size_lad'] = $this->language->get('text_size_lad');
		$this->data['text_headdresses_og'] = $this->language->get('text_headdresses_og');
		$this->data['text_clothing_sizes_man_example'] = $this->language->get('text_clothing_sizes_man_example');
		$this->data['text_clothing_sizes_baby_example'] = $this->language->get('text_clothing_sizes_baby_example');
		$this->data['text_baby_size'] = $this->language->get('text_baby_size');
		$this->data['text_baby_heght'] = $this->language->get('text_baby_heght');
		$this->data['text_baby_vozr'] = $this->language->get('text_baby_vozr');
		$this->data['text_mon'] = $this->language->get('text_mon');
		$this->data['text_god'] = $this->language->get('text_god');
		$this->data['text_goda'] = $this->language->get('text_goda');
		$this->data['text_let'] = $this->language->get('text_let');
		$this->data['text_os'] = $this->language->get('text_os');
		$this->data['text_clothing_sizes_shoes'] = $this->language->get('text_clothing_sizes_shoes');
		$this->data['text_clothing_sizes_shoes_example'] = $this->language->get('text_clothing_sizes_shoes_example');
		$this->data['text_sizes_shoes_nos'] = $this->language->get('text_sizes_shoes_nos');
		$this->data['text_size_stopa'] = $this->language->get('text_size_stopa');
		
		$this->data['tab_clothing_sizes'] = $this->language->get('tab_clothing_sizes');
		$this->data['tab_shoe_sizes'] = $this->language->get('tab_shoe_sizes');
		$this->data['tab_clothing_sizes_man'] = $this->language->get('tab_clothing_sizes_man');
		$this->data['tab_clothing_sizes_woman'] = $this->language->get('tab_clothing_sizes_woman');
		$this->data['tab_clothing_sizes_baby'] = $this->language->get('tab_clothing_sizes_baby');
		$this->data['tab_clothing_size'] = $this->language->get('tab_clothing_size');
		$this->data['tab_sizes_jeans'] = $this->language->get('tab_sizes_jeans');
		$this->data['tab_sizes_lingerie'] = $this->language->get('tab_sizes_lingerie');
		$this->data['tab_sizes_swimwear'] = $this->language->get('tab_sizes_swimwear');
		$this->data['tab_sizes_gloves'] = $this->language->get('tab_sizes_gloves');
		$this->data['tab_sizes_headdresses'] = $this->language->get('tab_sizes_headdresses');
		$this->data['tab_sizes_gloves_baby'] = $this->language->get('tab_sizes_gloves_baby');
		$this->data['tab_sizes_colgote'] = $this->language->get('tab_sizes_colgote');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/table_size.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/table_size.tpl';
		} else {
			$this->template = 'default/template/module/table_size.tpl';
		}

		$this->render();
	}
}
?>