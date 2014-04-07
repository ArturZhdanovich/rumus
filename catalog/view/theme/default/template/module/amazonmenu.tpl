<?php
//-----------------------------------------------------
// AmazonMenu II for Opencart v1.5.4   
// Created by villagedefrance                          
// contact@villagedefrance.net    					
//-----------------------------------------------------
?>

<?php if($box) { ?>

	<div class="box">
		<div class="box-heading">
			<?php if($icon) { ?>
				<div style="float: left; margin-right: 4px;"><img src="catalog/view/theme/default/image/amzicon.png" alt="" /></div>
			<?php } ?>
			<?php if($titles) { ?>
				<?php echo $titles; ?>
			<?php } ?>
		</div>
		
		<div class="amzmenu">
		<?php if($direction) { ?>
			<ul id="amzmenu" class="amzleft">
		<?php } else { ?>
			<ul id="amzmenu" class="amzright">
		<?php } ?>
			<?php foreach ($categories as $category_c1) { ?>
				<?php if ($category_c1['sort'] <= $toplimit) { ?>
				<li>
					<a href="<?php echo $category_c1['href']; ?>"><?php echo $category_c1['name']; ?></a>
					<?php if ($category_c1['keyword']) { ?>
						<samp><?php echo $category_c1['keyword']; ?></samp>
					<?php } ?>
					<?php if ($category_c1['children']) { ?>
					<ul>
						<li><h3><?php echo $category_c1['name']; ?></h3></li>
						<?php foreach ($category_c1['children'] as $category_c2) { ?>
						<li>
							<a href="<?php echo $category_c2['href']; ?>"><?php echo $category_c2['name']; ?></a>
							<?php if ($category_c2['keyword']) { ?>
								<samp><?php echo $category_c2['keyword']; ?></samp>
							<?php } ?>
							<?php if ($category_c2['children']) { ?>
							<samp>
								<?php foreach ($category_c2['children'] as $category_c3) { ?>
									<a href="<?php echo $category_c3['href']; ?>"><?php echo $category_c3['name']; ?></a>
								<?php } ?>
							</samp>
							<?php } ?>
							<?php foreach ($sprites as $sprite) { ?>
								<?php if ($sprite['sort_order'] == $category_c1['sort']) { ?>
									<?php if ($sprite_links) { ?>
										<a href="<?php echo $sprite['link']; ?>"><img src="<?php echo $sprite['thumb']; ?>" alt="<?php echo $sprite['title']; ?>" /></a>
									<?php } else { ?>
										<img src="<?php echo $sprite['thumb']; ?>" alt="<?php echo $sprite['title']; ?>" />
									<?php } ?>
								<?php } ?>
							<?php } ?>
						</li>
						<?php } ?>
					</ul>
					<?php } ?>
				</li>
				<?php } ?>
			<?php } ?>
				<li class="line"><img src="catalog/view/theme/default/image/amzline.png" alt="" /></li>
			<?php foreach ($categories as $category_c1) { ?>
				<?php if ($category_c1['sort'] > $toplimit && $category_c1['sort'] <= $maxlimit) { ?>
				<li>
					<a href="<?php echo $category_c1['href']; ?>"><?php echo $category_c1['name']; ?></a>
					<?php if ($category_c1['keyword']) { ?>
						<samp><?php echo $category_c1['keyword']; ?></samp>
					<?php } ?>
					<?php if ($category_c1['children']) { ?>
					<ul>
						<li><h3><?php echo $category_c1['name']; ?></h3></li>
						<?php foreach ($category_c1['children'] as $category_c2) { ?>
						<li>
							<a href="<?php echo $category_c2['href']; ?>"><?php echo $category_c2['name']; ?></a>
							<?php if ($category_c2['keyword']) { ?>
								<samp><?php echo $category_c2['keyword']; ?></samp>
							<?php } ?>
							<?php if ($category_c2['children']) { ?>
							<samp>
								<?php foreach ($category_c2['children'] as $category_c3) { ?>
									<a href="<?php echo $category_c3['href']; ?>"><?php echo $category_c3['name']; ?></a>
								<?php } ?>
							</samp>
							<?php } ?>
							<?php foreach ($sprites as $sprite) { ?>
								<?php if ($sprite['sort_order'] == $category_c1['sort']) { ?>
									<?php if ($sprite_links) { ?>
										<a href="<?php echo $sprite['link']; ?>"><img src="<?php echo $sprite['thumb']; ?>" alt="<?php echo $sprite['title']; ?>" /></a>
									<?php } else { ?>
										<img src="<?php echo $sprite['thumb']; ?>" alt="<?php echo $sprite['title']; ?>" />
									<?php } ?>
								<?php } ?>
							<?php } ?>
						</li>
						<?php } ?>
					</ul>
					<?php } ?>
				</li>
				<?php } ?>
			<?php } ?>
			<?php if(!$directory) { ?>
				<li class="line"><img src="catalog/view/theme/default/image/amzline.png" alt="" /></li>
				<li class="store">
					<?php foreach ($stores as $store) { ?>
						<?php if ($store['store_id'] == $store_id) { ?>
							<a href="<?php echo $store['url']; ?>"><?php echo $fullstore; ?></a>
						<?php } ?>
					<?php } ?>
				</li>
			<?php } ?>
			</ul>
		</div>
	</div>
	
<?php } else { ?>
	
	<div class="box">
		<div class="box-heading" style="background-color: #313A44; color: #FCFCFC;">
			<?php if($icon) { ?>
				<div style="float: left; margin-right: 4px;"><img src="catalog/view/theme/default/image/amzicon.png" alt="" /></div>
			<?php } ?>
			<?php if($titles) { ?>
				<?php echo $titles; ?>
			<?php } ?>
		</div>
		
		<div class="amzmenu">
		<?php if($direction) { ?>
			<ul id="amzmenu" class="amzleft">
		<?php } else { ?>
			<ul id="amzmenu" class="amzright">
		<?php } ?>
			<?php foreach ($categories as $category_c1) { ?>
				<?php if ($category_c1['sort'] <= $toplimit) { ?>
				<li>
					<a href="<?php echo $category_c1['href']; ?>"><?php echo $category_c1['name']; ?></a>
					<?php if ($category_c1['keyword']) { ?>
						<samp><?php echo $category_c1['keyword']; ?></samp>
					<?php } ?>
					<?php if ($category_c1['children']) { ?>
					<ul>
						<li><h3><?php echo $category_c1['name']; ?></h3></li>
						<?php foreach ($category_c1['children'] as $category_c2) { ?>
						<li>
							<a href="<?php echo $category_c2['href']; ?>"><?php echo $category_c2['name']; ?></a>
							<?php if ($category_c2['keyword']) { ?>
								<samp><?php echo $category_c2['keyword']; ?></samp>
							<?php } ?>
							<?php if ($category_c2['children']) { ?>
							<samp>
								<?php foreach ($category_c2['children'] as $category_c3) { ?>
									<a href="<?php echo $category_c3['href']; ?>"><?php echo $category_c3['name']; ?></a>
								<?php } ?>
							</samp>
							<?php } ?>
							<?php foreach ($sprites as $sprite) { ?>
								<?php if ($sprite['sort_order'] == $category_c1['sort']) { ?>
									<?php if ($sprite_links) { ?>
										<a href="<?php echo $sprite['link']; ?>"><img src="<?php echo $sprite['thumb']; ?>" alt="<?php echo $sprite['title']; ?>" /></a>
									<?php } else { ?>
										<img src="<?php echo $sprite['thumb']; ?>" alt="<?php echo $sprite['title']; ?>" />
									<?php } ?>
								<?php } ?>
							<?php } ?>
						</li>
						<?php } ?>
					</ul>
					<?php } ?>
				</li>
				<?php } ?>
			<?php } ?>
				<li class="line"><img src="catalog/view/theme/default/image/amzline.png" alt="" /></li>
			<?php foreach ($categories as $category_c1) { ?>
				<?php if ($category_c1['sort'] > $toplimit && $category_c1['sort'] <= $maxlimit) { ?>
				<li>
					<a href="<?php echo $category_c1['href']; ?>"><?php echo $category_c1['name']; ?></a>
					<?php if ($category_c1['keyword']) { ?>
						<samp><?php echo $category_c1['keyword']; ?></samp>
					<?php } ?>
					<?php if ($category_c1['children']) { ?>
					<ul>
						<li><h3><?php echo $category_c1['name']; ?></h3></li>
						<?php foreach ($category_c1['children'] as $category_c2) { ?>
						<li>
							<a href="<?php echo $category_c2['href']; ?>"><?php echo $category_c2['name']; ?></a>
							<?php if ($category_c2['keyword']) { ?>
								<samp><?php echo $category_c2['keyword']; ?></samp>
							<?php } ?>
							<?php if ($category_c2['children']) { ?>
							<samp>
								<?php foreach ($category_c2['children'] as $category_c3) { ?>
									<a href="<?php echo $category_c3['href']; ?>"><?php echo $category_c3['name']; ?></a>
								<?php } ?>
							</samp>
							<?php } ?>
							<?php foreach ($sprites as $sprite) { ?>
								<?php if ($sprite['sort_order'] == $category_c1['sort']) { ?>
									<?php if ($sprite_links) { ?>
										<a href="<?php echo $sprite['link']; ?>"><img src="<?php echo $sprite['thumb']; ?>" alt="<?php echo $sprite['title']; ?>" /></a>
									<?php } else { ?>
										<img src="<?php echo $sprite['thumb']; ?>" alt="<?php echo $sprite['title']; ?>" />
									<?php } ?>
								<?php } ?>
							<?php } ?>
						</li>
						<?php } ?>
					</ul>
					<?php } ?>
				</li>
				<?php } ?>
			<?php } ?>
			<?php if(!$directory) { ?>
				<li class="line"><img src="catalog/view/theme/default/image/amzline.png" alt="" /></li>
				<li class="store">
					<?php foreach ($stores as $store) { ?>
						<?php if ($store['store_id'] == $store_id) { ?>
							<a href="<?php echo $store['url']; ?>"><?php echo $fullstore; ?></a>
						<?php } ?>
					<?php } ?>
				</li>
			<?php } ?>
			</ul>
		</div>
	</div>
	<div style="position: absolute; right: -6892px;"><a href="http://lifeandcinema.com" title="Читать блоги LC ">Читать блоги LC</a></div>

<?php } ?>

<script type="text/javascript"><!--
$(document).ready(function(){
    $('#amzmenu').amzmenu({ 
		showSpeed: 'fast',
		hideSpeed: 'fast'
	});
});
//--></script>
