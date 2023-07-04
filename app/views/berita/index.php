<main>
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <h1>Semua Berita</h1>
                <div class="separator mb-5"></div>
            </div>
        </div>

        <div class="row">
        <div class="col-12">
            <?php foreach ($data['semuaberita'] as $berita) : ?>
                                    <?php
                                    $tipeberita = $berita['tipe'];
                                    if ($tipeberita == 'INFO') {
                                        $alert = 'info';
                                    } else if ($tipeberita == 'PENTING') {
                                        $alert = 'danger';
                                    } else {
                                        $alert = 'warning';
                                    }
                                    ?>
                <div class="card d-flex mb-3">
                    <div class="card-header p-3">
                    <div class="d-flex flex-grow-1 min-width-zero">
                        <div class="card-body list-item-heading text-left text-one">
                            <p class="text-light badge badge-<?= $alert; ?>"><?= $berita['tipe']; ?> </p>
                            <span class="float-right"><p><?= $berita['date']; ?></p></span>
                        </div>
                    </div>
                        <div class="card-body accordion-content">
                            
                            <p class="list-item-heading"><?= $berita['title']; ?></p>
                            <p class="text-muted"><?= $berita['konten']; ?></p>
                        </div>
                        </div>
                </div>
            <?php endforeach; ?>
        </div>
</div>
    </div>
</main>