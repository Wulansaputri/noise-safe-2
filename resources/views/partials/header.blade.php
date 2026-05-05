<nav class="bg-white shadow-sm fixed w-full z-50">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between items-center h-20">
            <!-- Logo -->
            <div class="flex items-center">
                <a href="/" class="text-2xl font-bold text-blue-600">
                    Noise<span class="text-blue-800">Safe</span>
                </a>
            </div>
            
            <!-- Desktop Menu -->
            <div class="hidden md:flex items-center space-x-8">
                <a href="#fitur" class="text-gray-700 hover:text-blue-600 transition">Fitur</a>
                <a href="#cara-kerja" class="text-gray-700 hover:text-blue-600 transition">Cara Kerja</a>
                <a href="#harga" class="text-gray-700 hover:text-blue-600 transition">Harga</a>
                <a href="#faq" class="text-gray-700 hover:text-blue-600 transition">FAQ</a>
                <a href="#waiting-list" 
                   class="bg-yellow-400 text-gray-900 px-6 py-3 rounded-full font-semibold hover:bg-yellow-500 transition shadow-lg">
                    Daftar Waiting List
                </a>
            </div>
            
            <!-- Mobile Menu Button -->
            <button class="md:hidden" onclick="toggleMobileMenu()">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path>
                </svg>
            </button>
        </div>
    </div>
    
    <!-- Mobile Menu -->
    <div id="mobile-menu" class="hidden md:hidden bg-white border-t">
        <div class="px-4 py-3 space-y-2">
            <a href="#fitur" class="block py-2 text-gray-700">Fitur</a>
            <a href="#cara-kerja" class="block py-2 text-gray-700">Cara Kerja</a>
            <a href="#harga" class="block py-2 text-gray-700">Harga</a>
            <a href="#faq" class="block py-2 text-gray-700">FAQ</a>
            <a href="#waiting-list" class="block py-2 text-yellow-500 font-semibold">Daftar Waiting List</a>
        </div>
    </div>
</nav>

<script>
    function toggleMobileMenu() {
        const menu = document.getElementById('mobile-menu');
        menu.classList.toggle('hidden');
    }
</script>