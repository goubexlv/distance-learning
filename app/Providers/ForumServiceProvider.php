<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Route;

class ForumServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        // Tu peux effectuer des liaisons de service ici si nécessaire
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        // Charge les routes spécifiques du forum à partir d'un fichier
        $this->loadRoutesFrom(base_path('routes/web.php'));

        // Charge les vues spécifiques du forum depuis un dossier
        $this->loadViewsFrom(resource_path('views/vendor/forum'), 'forum'); 

        // Publie les ressources (vues, assets, etc.) du forum vers le dossier public
        $this->publishes([
            __DIR__.'/views' => resource_path('views/vendor/forum'),
            // Autres ressources du forum à publier ici
        ], 'forum');
    }
}
