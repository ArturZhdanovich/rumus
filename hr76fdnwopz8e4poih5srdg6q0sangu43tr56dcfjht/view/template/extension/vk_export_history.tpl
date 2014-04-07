<?php foreach ($export as $export) {
                              ?>
                              <div><a target="_blank" href="<?php echo $export['link']; ?>"><?php echo $export['date']; ?></a> 
                              <a title="Удалить из альбомов" onclick="if (!confirm('Действительно удалить?')) return false;" href="<?php echo $export['delete_link'] ?>">[x]</a></div>
                              <?php
                          }
?>
